package com.mirego.cschat.models;

import java.util.List;

public class Conversation {

    private Message lastMessage;
    private List<String> userIds;

    public List<String> getUsers() {
        return userIds;
    }

    public void setUserIds(List<String> userIds) {
        this.userIds = userIds;
    }

    public Message getLastMessage() {
        return lastMessage;
    }

    public void setLastMessage(Message lastMessage) {
        this.lastMessage = lastMessage;
    }
}
