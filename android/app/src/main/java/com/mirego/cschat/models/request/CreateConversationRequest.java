package com.mirego.cschat.models.request;

import java.util.List;

public class CreateConversationRequest {
    private List<String> users;

    public CreateConversationRequest() {
    }

    public CreateConversationRequest(List<String> users) {
        this.users = users;
    }

    public List<String> getUsers() {
        return users;
    }

    public void setUsers(List<String> users) {
        this.users = users;
    }
}
