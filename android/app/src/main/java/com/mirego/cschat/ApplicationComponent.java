package com.mirego.cschat;

import com.mirego.cschat.activities.MainActivity;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = AndroidModule.class)
public interface ApplicationComponent {
    void inject(MainActivity mainActivity);
}
