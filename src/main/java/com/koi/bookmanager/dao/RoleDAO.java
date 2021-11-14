package com.koi.bookmanager.dao;

import com.koi.bookmanager.entity.Role;

public interface RoleDAO {
    Role findRoleByName(String theRoleName);
}
