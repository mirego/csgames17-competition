package com.mirego.cschat;

import android.app.Application;

public class CSChatApplication extends Application {

    private ApplicationComponent component;

    @Override
    public void onCreate() {
        super.onCreate();

        component = DaggerApplicationComponent.builder()
                .build();
    }

    public ApplicationComponent component() {
        return component;
    }
}
