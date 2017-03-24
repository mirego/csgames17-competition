package com.mirego.cschat.viewdatas;

import com.mirego.cschat.models.User;

public class UserViewData {

    private User user;

    public UserViewData(User user) {
        this.user = user;
    }

    public String username() {
        return user.getUsername();
    }

}
