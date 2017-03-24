package com.mirego.cschat.services;

import com.mirego.cschat.models.LoginRequest;

import io.reactivex.Flowable;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface CSChatService {

    @POST("login")
    Flowable<Void> login(@Body LoginRequest loginRequest);

}
