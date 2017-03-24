package com.mirego.cschat.activities;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.Snackbar;
import android.view.ViewGroup;
import android.widget.EditText;

import com.mirego.cschat.CSChatApplication;
import com.mirego.cschat.Prefs;
import com.mirego.cschat.R;
import com.mirego.cschat.controller.LoginController;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;

import static android.support.design.widget.Snackbar.LENGTH_SHORT;

public class LoginActivity extends BaseActivity {

    @BindView(R.id.login_root)
    ViewGroup root;

    @BindView(R.id.et_username)
    EditText etUsername;

    @BindView(R.id.et_password)
    EditText etPassword;

    @Inject
    LoginController loginController;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_login);
        ButterKnife.bind(this);

        ((CSChatApplication) getApplication()).component().inject(this);

        loadUsername();
    }

    private void loadUsername() {

        SharedPreferences sharedPreferences = this.getSharedPreferences(getPackageName(), Context.MODE_PRIVATE);

        String username = sharedPreferences.getString(Prefs.KEY_USERNAME, null);
        if (username != null) {
            etUsername.setText(username);
        }
    }

    @OnClick(R.id.btn_login_submit)
    void onLoginClicked() {
        loginController.login(etUsername.getText().toString(), etPassword.getText().toString())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeOn(Schedulers.newThread())
                .subscribe(new Consumer<Boolean>() {
                    @Override
                    public void accept(@NonNull Boolean success) throws Exception {
                        if (success) {
                            // TODO
                        } else {
                            Snackbar.make(root, R.string.login_error, LENGTH_SHORT).show();
                        }
                    }
                });
    }
}
