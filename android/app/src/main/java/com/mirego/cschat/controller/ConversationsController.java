package com.mirego.cschat.controller;


import android.content.Context;

import com.mirego.cschat.models.Conversation;
import com.mirego.cschat.models.response.ConversationsResponse;
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
    private Context context;

    public ConversationsController(CSChatService chatService, StorageService storageService, Context context) {
        this.chatService = chatService;
        this.storageService = storageService;
        this.context = context;
    }

    public Flowable<List<ConversationViewData>> getConversations() {
        return chatService.fetchConversations(storageService.currentUserId())
                .map(new Function<ConversationsResponse, List<ConversationViewData>>() {
                    @Override
                    public List<ConversationViewData> apply(@NonNull ConversationsResponse conversationsResponses) throws Exception {
                        List<ConversationViewData> conversationViewDatum = new ArrayList<>();
                        for (Conversation conversation : conversationsResponses.getConversations()) {
                            conversationViewDatum.add(new ConversationViewData(conversation, conversationsResponses.getUsers(), storageService.currentUserId(), context));
                        }
                        return conversationViewDatum;
                    }
                });
    }
}
