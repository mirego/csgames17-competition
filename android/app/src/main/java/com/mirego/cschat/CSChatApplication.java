package com.mirego.cschat;

import android.app.Application;

import uk.co.chrisjenx.calligraphy.CalligraphyConfig;

public class CSChatApplication extends Application {

    private ApplicationComponent component;

    @Override
    public void onCreate() {
        super.onCreate();

        component = DaggerApplicationComponent.builder()
                .build();

        CalligraphyConfig.initDefault(new CalligraphyConfig.Builder()
                .setDefaultFontPath(getString(R.string.font_lato_regular))
                .setFontAttrId(R.attr.fontPath)
                .build()
        );
    }

    public ApplicationComponent component() {
        return component;
    }
}
