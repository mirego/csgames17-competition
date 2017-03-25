package com.mirego.cschat.viewdatas;

import android.text.format.DateUtils;

import com.mirego.cschat.models.Message;
import com.mirego.cschat.models.User;

import java.util.Date;

public class MessageViewData {

    private final Message message;
    private final User user;

    public MessageViewData(Message message, User user) {
        this.message = message;
        this.user = user;
    }

    public String message() {
        return message.getMessage();
    }

    public String timestamp() {
        Date timestamp = message.getTimestamp();
        return DateUtils.getRelativeTimeSpanString(timestamp.getTime(), new Date().getTime(), DateUtils.FORMAT_ABBREV_ALL).toString();
    }

    public String avatarUrl() {
        if (user != null) {
            return user.getAvatarUrl();
        }
        return null;
    }

    public String username() {
        if (user != null) {
            return user.getUsername();
        }
        return null;
    }
}
