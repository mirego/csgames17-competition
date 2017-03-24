package com.mirego.cschat;

import com.mirego.cschat.controller.ConversationsController;
import com.mirego.cschat.controller.LoginController;
import com.mirego.cschat.services.CSChatService;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

@Module
class AndroidModule {

    private final CSChatApplication application;

    public AndroidModule(CSChatApplication application) {
        this.application = application;
    }

    @Provides
    @Singleton
    Retrofit provideRetrofit() {
        return new Retrofit.Builder()
                .baseUrl("http://10.3.1.35:3000")
                .addConverterFactory(GsonConverterFactory.create())
                .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .build();
    }

    @Provides
    @Singleton
    CSChatService provideChatService(Retrofit retrofit) {
        return retrofit.create(CSChatService.class);
    }

    @Provides
    LoginController provideLoginController(CSChatService chatService) {
        return new LoginController(chatService);
    }

    @Provides
    ConversationsController provideConversationsController(CSChatService chatService) {
        return new ConversationsController(chatService);
    }

}
