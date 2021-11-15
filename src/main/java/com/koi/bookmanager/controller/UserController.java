package com.koi.bookmanager.controller;

import com.koi.bookmanager.constant.Sort;
import com.koi.bookmanager.entity.Category;
import com.koi.bookmanager.entity.User;
import com.koi.bookmanager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/list")
    public String getList(Model model, @RequestParam(required = false) String sort) {
        List<User> users;
        if (sort != null) {
            int sortField = Integer.parseInt(sort);
            users = userService.getList(sortField);
        } else {
            users = userService.getList(Sort.User.ID);
        }
        model.addAttribute("users", users);
        return "user/list";
    }

    @RequestMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model model) {
        List<User> users = userService.search(keyword);
        model.addAttribute("users", users);
        return "user/list";
    }
}
