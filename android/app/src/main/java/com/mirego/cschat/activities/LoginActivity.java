package com.mirego.cschat.activities;

import android.os.Bundle;
import android.support.annotation.Nullable;

import com.mirego.cschat.CSChatApplication;
import com.mirego.cschat.R;

public class LoginActivity extends BaseActivity {

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_login);

        ((CSChatApplication) getApplication()).component().inject(this);
    }
}
