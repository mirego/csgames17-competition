package com.mirego.cschat.viewdatas;

import com.mirego.cschat.models.Message;

import java.text.DateFormat;

public class MessageViewData {

    private Message message;
    private DateFormat dateFormat = DateFormat.getTimeInstance();

    public MessageViewData(Message message) {
        this.message = message;
    }

    public String message() {
        return message.getMessage();
    }

    public String timestamp() {
        return dateFormat.format(message.getTimestamps());
    }
}
