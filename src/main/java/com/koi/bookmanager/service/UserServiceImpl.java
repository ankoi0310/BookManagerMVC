package com.koi.bookmanager.service;

import com.koi.bookmanager.dao.RoleDAO;
import com.koi.bookmanager.dao.UserDAO;
import com.koi.bookmanager.entity.RegisteredUser;
import com.koi.bookmanager.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service("myUserDetailsService")
public class UserServiceImpl implements UserService {

    private UserDAO userDAO;
    private RoleDAO roleDAO;
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImpl(UserDAO userDAO, RoleDAO roleDAO, BCryptPasswordEncoder passwordEncoder) {
        this.userDAO = userDAO;
        this.roleDAO = roleDAO;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        com.koi.bookmanager.entity.User user = userDAO.findByUserName(username);
        if (user == null)
            throw new UsernameNotFoundException("Invalid username or password!");

        List<Role> roleList = user.getRoles();

        List<GrantedAuthority> grantedAuthorityList = new ArrayList<>();
        for (Role role : roleList) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(role.getName());
            grantedAuthorityList.add(grantedAuthority);
        }
        return new User(user.getUsername(), user.getPassword(), grantedAuthorityList);
    }

    @Override
    @Transactional
    public com.koi.bookmanager.entity.User findByUserName(String userName) {
        return userDAO.findByUserName(userName);
    }

    @Override
    @Transactional
    public void save(RegisteredUser registeredUser) {
        com.koi.bookmanager.entity.User user = new com.koi.bookmanager.entity.User();
        user.setUsername(registeredUser.getUserName());
        user.setPassword(passwordEncoder.encode(registeredUser.getPassword()));
        user.setEmail(registeredUser.getEmail());
        user.setEnabled(true);

        // give a default role of employee
        user.setRoles(Arrays.asList(roleDAO.findRoleByName("ROLE_EMPLOYEE")));
        userDAO.save(user);
    }
}
