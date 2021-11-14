package com.koi.bookmanager.dao;

import com.koi.bookmanager.constant.Sort;
import com.koi.bookmanager.entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryDAO implements GeneralDAO<Category> {

    private SessionFactory sessionFactory;

    @Autowired
    public CategoryDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Category> getList(int sortField) {
        Session session = sessionFactory.getCurrentSession();
        String sort = sortField == Sort.Category.NAME ? "name" : "id";
        Query<Category> query = session.createQuery("from Category order by " + sort, Category.class);
        return query.getResultList();
    }

    @Override
    public void save(Category item) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(item);
    }

    @Override
    public Category get(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Category.class, id);
    }

    @Override
    public void delete(int id) {
        Session session = sessionFactory.getCurrentSession();
        session.createQuery("delete from Category where id =:id").setParameter("id", id).executeUpdate();
    }

    @Override
    public List<Category> search(String keyword) {
        Session session = sessionFactory.getCurrentSession();
        Query<Category> query;
        if (keyword != null && keyword.trim().length() > 0) {
            query = session.createQuery("from Category where lower(name) like :name", Category.class);
            query.setParameter("name", "%" + keyword + "%");
        } else
            query = session.createQuery("from Category", Category.class);
        return query.getResultList();
    }
}
