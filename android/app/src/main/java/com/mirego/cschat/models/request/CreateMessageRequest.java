package com.mirego.cschat.models.request;

public class CreateMessageRequest {

    private String message;

    public CreateMessageRequest() {
    }

    public CreateMessageRequest(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
