package com.mirego.cschat.controller;


import com.mirego.cschat.services.CSChatService;

public class ConversationsController {

    private final CSChatService chatService;

    public ConversationsController(CSChatService chatService) {
        this.chatService = chatService;
    }



}
