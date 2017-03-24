package com.mirego.cschat.viewdatas;

import com.mirego.cschat.models.Conversation;
import com.mirego.cschat.models.User;

import java.util.ArrayList;
import java.util.List;

public class ConversationViewData {

    private final Conversation conversation;
    private final List<UserViewData> userViewDatas;

    public ConversationViewData(Conversation conversation, List<User> users) {
        this.conversation = conversation;
        userViewDatas = new ArrayList<>();
        for (User user : users) {
            userViewDatas.add(new UserViewData(user));
        }
    }

    public MessageViewData lastMessage() {
        return new MessageViewData(conversation.getLastMessage());
    }

    public List<UserViewData> users() {
        return userViewDatas;
    }

}
