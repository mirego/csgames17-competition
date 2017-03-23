package com.mirego.cschat;

import com.mirego.cschat.activities.LoginActivity;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = AndroidModule.class)
public interface ApplicationComponent {
    void inject(LoginActivity loginActivity);
}
