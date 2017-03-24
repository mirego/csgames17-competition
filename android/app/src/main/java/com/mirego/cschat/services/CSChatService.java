package com.mirego.cschat.services;

import com.mirego.cschat.models.User;
import com.mirego.cschat.models.request.CreateConversationRequest;
import com.mirego.cschat.models.request.CreateMessageRequest;
import com.mirego.cschat.models.request.LoginRequest;
import com.mirego.cschat.models.response.ConversationsResponse;

import io.reactivex.Flowable;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface CSChatService {

    @POST("login")
    Flowable<User> login(@Body LoginRequest loginRequest);

    @GET("users/{userId}/conversations")
    Flowable<ConversationsResponse> fetchConversations(@Path("userId") String userId);

    @GET("users/{userId}/conversations/{conversationId}")
    Flowable<ConversationsResponse> fetchConversation(@Path("userId") String userId, @Path("conversationId") String conversationId);

    @POST("users/{userId}/conversations")
    Flowable<ConversationsResponse> createConversation(@Path("userId") String userId, @Body CreateConversationRequest createConversationRequest);

    @POST("users/{userId}/conversations/{conversationId}")
    Flowable<ConversationsResponse> createMessage(@Path("userId") String userId, @Path("conversationId") String conversationId, @Body CreateMessageRequest createMessageRequest);

}
