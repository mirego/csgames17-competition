package com.mirego.cschat.viewdatas;

import android.content.Context;

import com.mirego.cschat.models.Conversation;
import com.mirego.cschat.models.Message;
import com.mirego.cschat.models.User;

import java.util.ArrayList;
import java.util.List;

public class ConversationViewData {

    private final Conversation conversation;
    private final List<User> users;
    private final String currentUserId;
    private Context context;

    public ConversationViewData(Conversation conversation, List<User> users, String currentUserId, Context context) {
        this.conversation = conversation;
        this.users = users;
        this.context = context;
        this.currentUserId = currentUserId;
    }

    public MessageViewData lastMessage() {
        return new MessageViewData(conversation.getLastMessage(), otherUserFromIds(conversation.getUsers()), context);
    }

    public List<MessageViewData> messages() {
        List<MessageViewData> messageViewDatas = new ArrayList<>();
        for (Message message : conversation.getMessages()) {
            messageViewDatas.add(new MessageViewData(message, userForUserId(message.getUserId()), context));
        }
        return messageViewDatas;
    }

    private User otherUserFromIds(List<String> userIds) {
        if (userIds != null) {
            for (String userId : userIds) {
                if (!currentUserId.equals(userId)) {
                    return userForUserId(userId);
                }
            }
        }
        return null;
    }

    public String conversationTitle() {
        User otherUser = otherUserFromIds(conversation.getUsers());
        if (otherUser != null) {
            return otherUser.getUsername();
        }
        return null;
    }


    private User userForUserId(String userId) {
        if (users != null) {
            for (User user : users) {
                if (user.getId().equals(userId)) {
                    return user;
                }
            }
        }
        return null;
    }

    public String id() {
        return conversation.getId();
    }
}
