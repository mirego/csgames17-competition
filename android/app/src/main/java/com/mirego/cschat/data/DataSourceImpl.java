package com.mirego.cschat.data;

import org.json.JSONObject;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class DataSourceImpl implements DataSource {

    private final String TIME_API_URL = "https://script.google.com/macros/s/AKfycbyd5AcbAnWi2Yn0xhFRbyzS4qMq1VucMVgVvhul5XqS9HkAyJY/exec?tz=America/Montreal";

    // Example: Mon, 12 Mar 2017 09:41:00 -0400
    private final String TIME_FORMAT = "EEE, d MMM yyyy HH:mm:ss Z";
    private final Locale TIME_LOCALE = Locale.ENGLISH;

    private DateFormat dateFormat = new SimpleDateFormat(TIME_FORMAT, TIME_LOCALE);
    private OkHttpClient client = new OkHttpClient();

    private Date currentDate = null;
    private RefreshCallback refreshCallback = null;

    @Override
    public void refreshData() {
        Request request = new Request.Builder()
                .url(TIME_API_URL)
                .build();

        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                currentDate = null;
                refreshCallback();
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
                try {
                    String jsonData = response.body().string();
                    JSONObject jsonObject = new JSONObject(jsonData);
                    String fullDate = jsonObject.getString("fulldate");
                    currentDate = dateFormat.parse(fullDate);
                } catch(Exception e) {
                    currentDate = null;
                }
                refreshCallback();
            }
        });
    }

    @Override
    public Date getCurrentDate() {
        return currentDate;
    }

    @Override
    public void setRefreshCallback(RefreshCallback refreshCallback)
    {
        this.refreshCallback = refreshCallback;
    }

    private void refreshCallback()
    {
        if (refreshCallback != null) {
            refreshCallback.onRefreshFinished();
        }
    }
}
