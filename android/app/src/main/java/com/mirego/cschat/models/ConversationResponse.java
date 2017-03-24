package com.mirego.cschat.models;

import java.util.List;

public class ConversationResponse {

    private List<Conversation> conversations;

    private List<User> users;

    public List<Conversation> getConversations() {
        return conversations;
    }

    public void setConversations(List<Conversation> conversations) {
        this.conversations = conversations;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
