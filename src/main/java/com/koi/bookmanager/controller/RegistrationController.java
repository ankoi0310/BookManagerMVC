package com.koi.bookmanager.controller;

import com.koi.bookmanager.entity.RegisteredUser;
import com.koi.bookmanager.entity.User;
import com.koi.bookmanager.service.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserService userService;

    @GetMapping("/showRegistrationForm")
    public String showRegistrationForm(Model theModel) {
        theModel.addAttribute("registeredUser", new RegisteredUser());
        return "registration-form";
    }

    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(@Valid @ModelAttribute("registeredUser") RegisteredUser theRegisteredUser,
                                          BindingResult theBindingResult, Model theModel) {

        String userName = theRegisteredUser.getUserName();

        // form validation
        if (theBindingResult.hasErrors())
            return "registration-form";

        // check if user already exists
        User existing = userService.findByUserName(userName);
        if (existing != null) {
            theModel.addAttribute("registeredUser", new RegisteredUser());
            theModel.addAttribute("registrationError", "User name already exists.");
            return "registration-form";
        }

        userService.save(theRegisteredUser);

        return "user-login";
    }
}
