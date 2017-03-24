package com.mirego.cschat.services;

import android.content.Context;
import android.content.SharedPreferences;

import com.mirego.cschat.Prefs;

public class StorageService {

    private Context context;
    private SharedPreferences sharedPreferences;

    public StorageService(Context context) {
        this.context = context;
        this.sharedPreferences = context.getSharedPreferences(context.getPackageName(), Context.MODE_PRIVATE);
    }

    public String currentUserId() {
        return sharedPreferences.getString(Prefs.KEY_USER_ID, null);
    }

    public void storeUserId(String userId) {
        sharedPreferences.edit().putString(Prefs.KEY_USER_ID, userId).apply();
    }

    public void clearUserId() {
        sharedPreferences.edit().remove(Prefs.KEY_USER_ID).apply();
    }


}
