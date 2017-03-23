package com.mirego.cschat;

import dagger.Module;

@Module
public class AndroidModule {

    private final CSChatApplication application;

    public AndroidModule(CSChatApplication application) {
        this.application = application;
    }


}
