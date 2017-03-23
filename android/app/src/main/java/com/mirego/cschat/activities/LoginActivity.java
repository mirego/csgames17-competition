package com.mirego.cschat.activities;

import android.os.Bundle;
import android.support.annotation.Nullable;

import com.mirego.cschat.CSChatApplication;

public class LoginActivity extends BaseActivity {

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ((CSChatApplication) getApplication()).component().inject(this);
    }
}
