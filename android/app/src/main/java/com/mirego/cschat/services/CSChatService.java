package com.mirego.cschat.services;

import com.mirego.cschat.models.LoginRequest;
import com.mirego.cschat.models.User;

import io.reactivex.Flowable;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface CSChatService {

    @POST("login")
    Flowable<User> login(@Body LoginRequest loginRequest);

}
