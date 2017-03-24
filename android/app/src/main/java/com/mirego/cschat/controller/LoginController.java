package com.mirego.cschat.controller;

import com.mirego.cschat.models.LoginRequest;
import com.mirego.cschat.services.CSChatService;

import io.reactivex.Flowable;
import io.reactivex.annotations.NonNull;
import io.reactivex.functions.Function;

public class LoginController {

    private final CSChatService chatService;

    public LoginController(CSChatService chatService) {
        this.chatService = chatService;
    }

    public Flowable<Boolean> login(String username, String password) {
        return chatService.login(new LoginRequest(username))
                .map(new Function<Void, Boolean>() {
                    @Override
                    public Boolean apply(@NonNull Void aVoid) throws Exception {
                        return true;
                    }
                })
                .onErrorReturnItem(false);
    }

}
