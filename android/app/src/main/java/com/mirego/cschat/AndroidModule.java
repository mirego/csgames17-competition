package com.mirego.cschat;

import com.mirego.cschat.controller.ConversationController;
import com.mirego.cschat.controller.ConversationsController;
import com.mirego.cschat.controller.LoginController;
import com.mirego.cschat.services.CSChatService;
import com.mirego.cschat.services.StorageService;

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
                // TODO: Changer pour votre propre serveur
                .baseUrl("http://10.240.193.56:3000")
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
    @Singleton
    StorageService provideStorageService() {
        return new StorageService(application);
    }

    @Provides
    LoginController provideLoginController(CSChatService chatService, StorageService storageService) {
        return new LoginController(chatService, storageService);
    }

    @Provides
    ConversationsController provideConversationsController(CSChatService chatService, StorageService storageService) {
        return new ConversationsController(chatService, storageService, application);
    }

    @Provides
    ConversationController proviceConversationController(CSChatService chatService, StorageService storageService) {
        return new ConversationController(chatService, storageService, application);
    }

}
