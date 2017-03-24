package com.mirego.cschat.services;

import com.mirego.cschat.models.ConversationResponse;
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
    Flowable<ConversationResponse> fetchConversations(@Path("userId") String userId);

}
