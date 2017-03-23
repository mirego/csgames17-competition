package com.mirego.cschat.activities;

import android.app.Activity;
import android.os.Bundle;
import android.text.format.DateFormat;
import android.widget.TextView;

import com.mirego.cschat.R;
import com.mirego.cschat.data.DataSource;
import com.mirego.cschat.data.DataSourceImpl;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import butterknife.BindView;
import butterknife.ButterKnife;

public class MainActivity extends Activity {

    private final long TIMER_INTERVAL = 1000;

    private DataSource dataSource = new DataSourceImpl();
    private Timer timer = new Timer();

    @BindView(R.id.week_day_text_view)
    TextView weekDayTextView;

    @BindView(R.id.day_text_view)
    TextView dayTextView;

    @BindView(R.id.month_text_view)
    TextView monthTextView;

    @BindView(R.id.time_text_view)
    TextView timeTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ButterKnife.bind(this);

        dataSource.setRefreshCallback(new DataSource.RefreshCallback() {
            @Override
            public void onRefreshFinished() {
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        displayDate(dataSource.getCurrentDate());
                    }
                });
            }
        });

        startTimer();
    }

    @Override
    public void onPause() {
        super.onPause();
        cancelTimer();
    }

    @Override
    public void onResume() {
        super.onResume();
        startTimer();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        cancelTimer();
    }

    private void startTimer() {
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                dataSource.refreshData();
            }
        }, 0, TIMER_INTERVAL);
    }

    private void cancelTimer() {
        timer.cancel();
        timer.purge();
    }

    private void displayDate(Date date) {
        if (date != null) {
            weekDayTextView.setText(DateFormat.format("EEEE", date));
            dayTextView.setText(DateFormat.format("dd", date));
            monthTextView.setText(DateFormat.format("MMMM", date));
            timeTextView.setText(DateFormat.format("HH'h' mm'm' ss's'", date));
        } else {
            weekDayTextView.setText("");
            dayTextView.setText("--");
            monthTextView.setText("");
            timeTextView.setText("");
        }
    }
}
