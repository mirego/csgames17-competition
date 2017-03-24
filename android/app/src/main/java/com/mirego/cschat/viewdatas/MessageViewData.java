package com.mirego.cschat.viewdatas;

import com.mirego.cschat.models.Message;
import com.mirego.cschat.models.User;

import java.text.DateFormat;

public class MessageViewData {

    private final Message message;
    private final User user;
    private final DateFormat dateFormat = DateFormat.getTimeInstance();

    public MessageViewData(Message message, User user) {
        this.message = message;
        this.user = user;
    }

    public String message() {
        return message.getMessage();
    }

    public String timestamp() {
        return dateFormat.format(message.getTimestamp());
    }

    public String avatarUrl() {
        return user.getAvatarUrl();
    }

    public String username() {
        return user.getUsername();
    }
}
