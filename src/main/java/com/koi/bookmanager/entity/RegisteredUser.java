package com.koi.bookmanager.entity;

import com.koi.bookmanager.validation.FieldMatch;
import com.koi.bookmanager.validation.ValidEmail;
import javax.validation.constraints.Size;

@FieldMatch(first = "password", second = "matchingPassword", message = "The password fields must match")
public class RegisteredUser {

    @Size(min = 1, message = "is required")
    private String userName;

    @Size(min = 1, message = "is required")
    private String password;

    @Size(min = 1, message = "is required")
    private String matchingPassword;

    @ValidEmail
    private String email;
    public RegisteredUser() {
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getMatchingPassword() {
        return matchingPassword;
    }
    public void setMatchingPassword(String matchingPassword) {
        this.matchingPassword = matchingPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
