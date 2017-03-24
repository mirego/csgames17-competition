package com.mirego.cschat.activities;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import com.mirego.cschat.CSChatApplication;
import com.mirego.cschat.R;
import com.mirego.cschat.adapters.ConversationAdapter;
import com.mirego.cschat.viewdatas.ConversationViewData;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class ConversationsActivity extends BaseActivity implements ConversationAdapter.ConversationAdapterListener {

    @BindView(R.id.rv_conversations)
    RecyclerView rvConversations;

    private ConversationAdapter conversationAdapter;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_conversations);
        ((CSChatApplication) getApplication()).component().inject(this);
        ButterKnife.bind(this);
        configureConversationsRecyclerView();
    }

    private void configureConversationsRecyclerView() {
        conversationAdapter = new ConversationAdapter(this);
        rvConversations.setLayoutManager(new LinearLayoutManager(this));
        rvConversations.setAdapter(conversationAdapter);
    }

    @OnClick(R.id.fab_add_conversation)
    public void onAddConversationClicked() {
        //TODO:
    }

    @Override
    public void onConversationClciked(ConversationViewData conversationViewData) {
        //TODO:
    }
}
