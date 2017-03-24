package com.mirego.cschat.viewdatas;

import com.mirego.cschat.models.Conversation;
import com.mirego.cschat.models.User;

import java.util.ArrayList;
import java.util.List;

public class ConversationViewData {

    private final Conversation conversation;
    private final List<User> users;
    private final String currentUserId;

    public ConversationViewData(Conversation conversation, List<User> users, String currentUserId) {
        this.conversation = conversation;
        this.users = users;
        this.currentUserId = currentUserId;
    }

    public MessageViewData lastMessage() {
        return new MessageViewData(conversation.getLastMessage(), userForUserId(conversation.getUsers()));
    }

    private User userForUserId(List<String> userIds) {
        for (String userId : userIds) {
            if (!currentUserId.equals(userId)) {
                return userForUserId(userId);
            }
        }
        return null;
    }

    private User userForUserId(String userId) {
        for (User user : users) {
            if (user.getId().equals(userId)) {
                return user;
            }
        }
        return null;
    }

}
