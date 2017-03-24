package com.mirego.cschat.viewdatas;

import com.mirego.cschat.models.Conversation;
import com.mirego.cschat.models.Message;
import com.mirego.cschat.models.User;

import java.util.ArrayList;
import java.util.List;

public class ConversationViewData {

    private final Conversation conversation;
    private final List<User> users;

    public ConversationViewData(Conversation conversation, List<User> users) {
        this.conversation = conversation;
        this.users = users;
    }

    public MessageViewData lastMessage() {
        return new MessageViewData(conversation.getLastMessage(), userForUserId(conversation.getLastMessage().getUserId()));
    }

    public List<MessageViewData> messages() {
        List<MessageViewData> messageViewDatas = new ArrayList<>();
        for (Message message : conversation.getMessages()) {
            messageViewDatas.add(new MessageViewData(message, userForUserId(message.getUserId())));
        }
        return messageViewDatas;
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
