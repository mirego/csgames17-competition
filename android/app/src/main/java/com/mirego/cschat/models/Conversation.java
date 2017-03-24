package com.mirego.cschat.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class Conversation {

    @SerializedName("_id")
    private String id;
    private Message lastMessage;
    private List<Message> messages;
    private List<String> users;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<String> getUsers() {
        return users;
    }

    public void setUsers(List<String> users) {
        this.users = users;
    }

    public Message getLastMessage() {
        return lastMessage;
    }

    public void setLastMessage(Message lastMessage) {
        this.lastMessage = lastMessage;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }
}
