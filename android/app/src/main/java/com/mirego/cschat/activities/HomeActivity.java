package com.mirego.cschat.activities;

import android.os.Bundle;
import android.support.annotation.Nullable;

import com.mirego.cschat.CSChatApplication;
import com.mirego.cschat.R;

import butterknife.ButterKnife;
import butterknife.OnClick;

public class HomeActivity extends BaseActivity {

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        ((CSChatApplication) getApplication()).component().inject(this);
        ButterKnife.bind(this);
    }

    @OnClick(R.id.btn_login)
    public void onLoginClicked() {

    }

    @OnClick(R.id.btn_login)
    public void onRegisterClicked() {
        //FIXME:
    }

}
