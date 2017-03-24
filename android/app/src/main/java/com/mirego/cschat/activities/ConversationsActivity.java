package com.mirego.cschat.activities;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;

import com.mirego.cschat.CSChatApplication;
import com.mirego.cschat.R;
import com.mirego.cschat.adapters.ConversationAdapter;
import com.mirego.cschat.controller.ConversationsController;
import com.mirego.cschat.controller.LoginController;
import com.mirego.cschat.viewdatas.ConversationViewData;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class ConversationsActivity extends BaseActivity implements ConversationAdapter.ConversationAdapterListener {

    @BindView(R.id.rv_conversations)
    RecyclerView rvConversations;

    @BindView(R.id.toolbar)
    Toolbar toolbar;

    @Inject
    ConversationsController conversationsController;

    @Inject
    LoginController loginController;

    private ConversationAdapter conversationAdapter;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_conversations);
        ((CSChatApplication) getApplication()).component().inject(this);
        ButterKnife.bind(this);

        setSupportActionBar(toolbar);
        toolbar.setTitle(getString(R.string.conversations_title));
        configureConversationsRecyclerView();
    }

    private void configureConversationsRecyclerView() {
        conversationAdapter = new ConversationAdapter(this);
        rvConversations.setLayoutManager(new LinearLayoutManager(this));
        rvConversations.setAdapter(conversationAdapter);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_conversations, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_logout) {
            loginController.logout();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @OnClick(R.id.fab_add_conversation)
    public void onAddConversationClicked() {
        //TODO:
    }

    @Override
    public void onConversationClicked(ConversationViewData conversationViewData) {
        //TODO:
    }
}
