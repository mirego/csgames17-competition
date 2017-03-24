package com.mirego.cschat.controller;

import com.mirego.cschat.models.LoginRequest;
import com.mirego.cschat.models.User;
import com.mirego.cschat.services.CSChatService;
import com.mirego.cschat.services.StorageService;

import io.reactivex.Flowable;

public class LoginController {

    private final CSChatService chatService;
    private final StorageService storageService;

    public LoginController(CSChatService chatService, StorageService storageService) {
        this.chatService = chatService;
        this.storageService = storageService;
    }

    public Flowable<User> login(String username, String password) {
        return chatService.login(new LoginRequest(username));
    }

    public void logout() {
        storageService.clearUserId();
    }

    public void saveUserId(String userId) {
        storageService.storeUserId(userId);
    }

}
