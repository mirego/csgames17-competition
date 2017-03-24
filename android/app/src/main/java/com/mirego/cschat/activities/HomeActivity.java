package com.mirego.cschat.activities;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.Nullable;

import com.mirego.cschat.CSChatApplication;
import com.mirego.cschat.Prefs;
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
        redirectIfLoggedIn();
    }

    private void redirectIfLoggedIn() {
        SharedPreferences sharedPreferences = getSharedPreferences(getPackageName(), MODE_PRIVATE);
        String userId = sharedPreferences.getString(Prefs.KEY_USER_ID, null);
        if (userId != null) {
            startActivity(new Intent(this, ConversationsActivity.class));
        }
    }

    @OnClick(R.id.btn_login)
    public void onLoginClicked() {
        startActivity(new Intent(this, LoginActivity.class));
    }

    @OnClick(R.id.btn_register)
    public void onRegisterClicked() {
        //FIXME:
    }

}
