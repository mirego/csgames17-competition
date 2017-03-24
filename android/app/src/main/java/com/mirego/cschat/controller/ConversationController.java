package com.mirego.cschat.controller;

import com.mirego.cschat.models.Conversation;
import com.mirego.cschat.models.request.CreateConversationRequest;
import com.mirego.cschat.models.request.CreateMessageRequest;
import com.mirego.cschat.models.response.ConversationsResponse;
import com.mirego.cschat.services.CSChatService;
import com.mirego.cschat.services.StorageService;
import com.mirego.cschat.viewdatas.ConversationViewData;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
                        return new ConversationViewData(conversationsResponse.getConversations().get(0), conversationsResponse.getUsers(), storageService.currentUserId());
                    }
                });
    }


    public Flowable<List<ConversationViewData>> createConversation(String userId) {
        return chatService.createConversation(storageService.currentUserId(), new CreateConversationRequest(Arrays.asList(storageService.currentUserId(), userId)))
                .map(new Function<ConversationsResponse, List<ConversationViewData>>() {
                    @Override
                    public List<ConversationViewData> apply(@NonNull ConversationsResponse conversationsResponse) throws Exception {
                        List<ConversationViewData> conversationViewDatum = new ArrayList<>();
                        for (Conversation conversation : conversationsResponse.getConversations()) {
                            conversationViewDatum.add(new ConversationViewData(conversation, conversationsResponse.getUsers(), storageService.currentUserId()));
                        }
                        return conversationViewDatum;
                    }
                });
    }

    public Flowable<ConversationViewData> createMessage(String conversationId, String message) {
        return chatService.createMessage(storageService.currentUserId(), conversationId, new CreateMessageRequest(message))
                .map(new Function<ConversationsResponse, ConversationViewData>() {
                    @Override
                    public ConversationViewData apply(@NonNull ConversationsResponse conversationsResponse) throws Exception {
                        return new ConversationViewData(conversationsResponse.getConversations().get(0), conversationsResponse.getUsers(), storageService.currentUserId());
                    }
                });
    }

}
