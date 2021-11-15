package com.koi.bookmanager.dao;

import com.koi.bookmanager.entity.User;

import java.util.List;

public interface UserDAO {
    User findByUserName(String username);
    void save(User user);
    List<User> getList(int sortField);
    List<User> search(String keyword);
}
