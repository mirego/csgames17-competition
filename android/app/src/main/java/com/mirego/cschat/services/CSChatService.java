package com.mirego.cschat.services;

import com.mirego.cschat.models.response.ConversationsResponse;
import com.mirego.cschat.models.LoginRequest;
import com.mirego.cschat.models.User;

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

    @GET("users/{userId}/conversations/{id}")
    Flowable<ConversationsResponse> fetchConversation(@Path("userId") String userId, @Path("id") String conversationId);

}
