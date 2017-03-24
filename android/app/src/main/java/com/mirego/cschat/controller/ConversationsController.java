package com.mirego.cschat.controller;


import com.mirego.cschat.models.Conversation;
import com.mirego.cschat.models.ConversationResponse;
import com.mirego.cschat.services.CSChatService;
import com.mirego.cschat.services.StorageService;
import com.mirego.cschat.viewdatas.ConversationViewData;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.Flowable;
import io.reactivex.annotations.NonNull;
import io.reactivex.functions.Function;

public class ConversationsController {

    private final CSChatService chatService;
    private final StorageService storageService;

    public ConversationsController(CSChatService chatService, StorageService storageService) {
        this.chatService = chatService;
        this.storageService = storageService;
    }

    public Flowable<List<ConversationViewData>> getConversations() {
        return chatService.fetchConversations(storageService.currentUserId())
                .map(new Function<ConversationResponse, List<ConversationViewData>>() {
                    @Override
                    public List<ConversationViewData> apply(@NonNull ConversationResponse conversationResponses) throws Exception {
                        List<ConversationViewData> conversationViewDatum = new ArrayList<>();
                        for (Conversation conversation : conversationResponses.getConversations()) {
                            conversationViewDatum.add(new ConversationViewData(conversation, conversationResponses.getUsers(), storageService.currentUserId()));
                        }
                        return conversationViewDatum;
                    }
                });
    }
}
