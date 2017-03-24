package com.mirego.cschat.controller;

import com.mirego.cschat.models.LoginRequest;
import com.mirego.cschat.models.User;
import com.mirego.cschat.services.CSChatService;

import io.reactivex.Flowable;

public class LoginController {

    private final CSChatService chatService;

    public LoginController(CSChatService chatService) {
        this.chatService = chatService;
    }

    public Flowable<User> login(String username, String password) {
        return chatService.login(new LoginRequest(username));
    }

}
