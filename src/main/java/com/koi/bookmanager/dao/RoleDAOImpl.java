package com.koi.bookmanager.dao;

import com.koi.bookmanager.entity.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDAOImpl implements RoleDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public RoleDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Role findRoleByName(String name) {
        Session currentSession = sessionFactory.getCurrentSession();

        Query<Role> theQuery = currentSession.createQuery("from Role where name=:name", Role.class);
        theQuery.setParameter("name", name);

        Role role;

        try {
            role = theQuery.getSingleResult();
        } catch (Exception e) {
            return null;
        }

        return role;
    }
}
