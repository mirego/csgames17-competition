package com.mirego.cschat.viewdatas;

import com.mirego.cschat.models.Conversation;
import com.mirego.cschat.models.User;

import java.util.ArrayList;
import java.util.List;

public class ConversationViewData {

    private Conversation conversation;

    public ConversationViewData(Conversation conversation) {
        this.conversation = conversation;
    }

    public MessageViewData lastMessage() {
        return new MessageViewData(conversation.getLastMessage());
    }

    public List<UserViewData> users() {
        List<UserViewData> users = new ArrayList<>();
        if (conversation.getUsers() != null) {
            for (User user : conversation.getUsers()) {
                users.add(new UserViewData(user));
            }
        }
        return users;
    }

}
