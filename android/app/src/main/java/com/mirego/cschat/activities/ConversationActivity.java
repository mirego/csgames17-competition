package com.mirego.cschat.activities;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.Snackbar;

import com.mirego.cschat.CSChatApplication;
import com.mirego.cschat.R;
import com.mirego.cschat.controller.ConversationController;
import com.mirego.cschat.viewdatas.ConversationViewData;

import java.util.List;

import javax.inject.Inject;

import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;

public class ConversationActivity extends BaseActivity {

    private static final String EXTRA_CONVERSATION_ID = "extraConversationId";

    @Inject
    ConversationController controller;

    public static Intent intent(Context context, String conversationId) {
        Intent intent = new Intent(context, ConversationActivity.class);
        intent.putExtra(EXTRA_CONVERSATION_ID, conversationId);
        return intent;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ((CSChatApplication) getApplication()).component().inject(this);
    }

    @Override
    protected void onResume() {
        super.onResume();

        fetchConversation();
    }

    private void fetchConversation() {
        controller.getConversation(getConversationId())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeOn(Schedulers.newThread())
                .subscribe(new Consumer<ConversationViewData>() {
                    @Override
                    public void accept(@NonNull ConversationViewData conversationViewDatas) throws Exception {
                        // todo
                        int i = 0;
                    }
                }, new Consumer<Throwable>() {
                    @Override
                    public void accept(@NonNull Throwable throwable) throws Exception {
                        // todo
                    }
                });
    }

    private String getConversationId() {
        return getIntent().getStringExtra(EXTRA_CONVERSATION_ID);
    }
}
