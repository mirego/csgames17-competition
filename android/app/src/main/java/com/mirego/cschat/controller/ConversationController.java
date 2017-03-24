package com.mirego.cschat.controller;

import com.mirego.cschat.models.response.ConversationsResponse;
import com.mirego.cschat.services.CSChatService;
import com.mirego.cschat.services.StorageService;
import com.mirego.cschat.viewdatas.ConversationViewData;

import io.reactivex.Flowable;
import io.reactivex.annotations.NonNull;
import io.reactivex.functions.Function;

public class ConversationController {

    private final CSChatService chatService;
    private final StorageService storageService;

    public ConversationController(CSChatService chatService, StorageService storageService) {
        this.chatService = chatService;
        this.storageService = storageService;
    }

    public Flowable<ConversationViewData> getConversation(String conversationId) {
        return chatService.fetchConversation(storageService.currentUserId(), conversationId)
                .map(new Function<ConversationsResponse, ConversationViewData>() {
                    @Override
                    public ConversationViewData apply(@NonNull ConversationsResponse conversationsResponse) throws Exception {
                        return new ConversationViewData(conversationsResponse.getConversations().get(0), conversationsResponse.getUsers());
                    }
                });
    }

}
