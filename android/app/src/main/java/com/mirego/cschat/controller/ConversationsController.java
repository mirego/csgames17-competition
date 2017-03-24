package com.mirego.cschat.controller;


import com.mirego.cschat.models.Conversation;
import com.mirego.cschat.models.ConversationResponse;
import com.mirego.cschat.services.CSChatService;
import com.mirego.cschat.viewdatas.ConversationViewData;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.Flowable;
import io.reactivex.annotations.NonNull;
import io.reactivex.functions.Function;

public class ConversationsController {

    private final CSChatService chatService;

    public ConversationsController(CSChatService chatService) {
        this.chatService = chatService;
    }

    public Flowable<List<ConversationViewData>> getConversations() {
        return chatService.fetchConversations("XCfb8hO18ZkHcN2X")
                .map(new Function<ConversationResponse, List<ConversationViewData>>() {
                    @Override
                    public List<ConversationViewData> apply(@NonNull ConversationResponse conversationResponses) throws Exception {
                        List<ConversationViewData> conversationViewDatum = new ArrayList<>();
                        for (Conversation conversation : conversationResponses.getConversations()) {
                            conversationViewDatum.add(new ConversationViewData(conversation, conversationResponses.getUsers()));
                        }
                        return conversationViewDatum;
                    }
                });
    }
}
