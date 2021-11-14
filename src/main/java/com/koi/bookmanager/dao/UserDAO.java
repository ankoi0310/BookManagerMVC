package com.koi.bookmanager.dao;

import com.koi.bookmanager.entity.User;

public interface UserDAO {
    User findByUserName(String username);
    void save(User user);
}
