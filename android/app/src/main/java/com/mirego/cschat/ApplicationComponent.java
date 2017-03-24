package com.mirego.cschat;

import com.mirego.cschat.activities.ConversationActivity;
import com.mirego.cschat.activities.ConversationsActivity;
import com.mirego.cschat.activities.HomeActivity;
import com.mirego.cschat.activities.LoginActivity;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = AndroidModule.class)
public interface ApplicationComponent {
    void inject(LoginActivity loginActivity);

    void inject(HomeActivity homeActivity);

    void inject(ConversationsActivity conversationsActivity);

    void inject(ConversationActivity conversationActivity);
}
