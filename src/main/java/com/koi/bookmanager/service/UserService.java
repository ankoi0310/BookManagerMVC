package com.koi.bookmanager.service;

import com.koi.bookmanager.entity.RegisteredUser;
import com.koi.bookmanager.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    User findByUserName(String userName);
    void save(RegisteredUser registeredUser);
}
