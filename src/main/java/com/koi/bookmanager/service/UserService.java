package com.koi.bookmanager.service;

import com.koi.bookmanager.entity.RegisteredUser;
import com.koi.bookmanager.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    User findByUserName(String userName);
    void save(RegisteredUser registeredUser);
    List<User> getList(int sortField);
    List<User> search(String keyword);
}
