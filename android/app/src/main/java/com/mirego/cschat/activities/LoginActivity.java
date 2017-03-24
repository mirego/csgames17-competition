package com.mirego.cschat.activities;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.widget.EditText;

import com.mirego.cschat.CSChatApplication;
import com.mirego.cschat.R;

import butterknife.BindView;
import butterknife.OnClick;

public class LoginActivity extends BaseActivity {

    @BindView(R.id.et_username)
    EditText etUsername;

    @BindView(R.id.et_password)
    EditText etPassword;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_login);

        ((CSChatApplication) getApplication()).component().inject(this);
    }

    @OnClick
    void onLogin() {

    }
}
