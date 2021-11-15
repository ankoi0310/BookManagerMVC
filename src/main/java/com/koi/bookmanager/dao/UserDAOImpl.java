package com.koi.bookmanager.dao;

import com.koi.bookmanager.constant.Sort;
import com.koi.bookmanager.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public UserDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public User findByUserName(String username) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("from User where username=:username", User.class);
        theQuery.setParameter("username", username);
        User user;
        try {
            user = theQuery.getSingleResult();
        } catch (Exception e) {
            return null;
        }
        return user;
    }

    @Override
    public void save(User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(user);
    }

    @Override
    public List<User> getList(int sortField) {
        Session session = sessionFactory.getCurrentSession();
        String sort;
        switch (sortField) {
            case Sort.User.USERNAME:
                sort = "username";
                break;
            case Sort.User.EMAIL:
                sort = "email";
                break;
            case Sort.User.ENABLED:
                sort = "enabled";
                break;
            default:
                sort = "id";
        }
        Query<User> query = session.createQuery("from User order by " + sort, User.class);
        return query.getResultList();
    }

    @Override
    public List<User> search(String keyword) {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query;
        if (keyword != null && keyword.trim().length() > 0) {
            query = session.createQuery("from User where lower(username) like :keyword or lower(email) like :keyword", User.class);
            query.setParameter("keyword", "%" + keyword + "%");
        } else
            query = session.createQuery("from User", User.class);
        return query.getResultList();
    }
}
