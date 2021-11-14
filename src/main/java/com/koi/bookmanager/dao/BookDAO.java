package com.koi.bookmanager.dao;

import com.koi.bookmanager.constant.Sort;
import com.koi.bookmanager.entity.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAO implements GeneralDAO<Book> {

    private SessionFactory sessionFactory;

    @Autowired
    public BookDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Book> getList(int sortField) {
        Session session = sessionFactory.getCurrentSession();
        String sort;
        switch (sortField) {
            case Sort.Book.TITLE:
                sort = "title";
                break;
            case Sort.Book.SUMMARY_CONTENT:
                sort = "summary_content";
                break;
            case Sort.Book.PRICE:
                sort = "price";
                break;
            case Sort.Book.AUTHOR:
                sort = "author";
                break;
            case Sort.Book.PUBLICATION_DATE:
                sort = "publication_date";
                break;
            case Sort.Book.CATEGORY_ID:
                sort = "category_id";
                break;
            default:
                sort = "id";
        }
        Query<Book> query = session.createQuery("from Book order by " + sort, Book.class);
        return query.getResultList();
    }

    @Override
    public void save(Book item) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(item);
    }

    @Override
    public Book get(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Book.class, id);
    }

    @Override
    public void delete(int id) {
        Session session = sessionFactory.getCurrentSession();
        session.createQuery("delete from Book where id =:id").setParameter("id", id).executeUpdate();
    }

    @Override
    public List<Book> search(String keyword) {
        Session session = sessionFactory.getCurrentSession();
        Query<Book> query;
        if (keyword != null && keyword.trim().length() > 0) {
            query = session.createQuery("from Book b, Category c where b.category = c and " +
                    "(lower(title) like :keyword or " +
                    "lower(summaryContent) like:keyword or " +
                    "lower(price) like:keyword or " +
                    "lower(author) like:keyword or " +
                    "lower(c.name) like:keyword)", Book.class);
            query.setParameter("keyword", "%" + keyword + "%");
        } else
            query = session.createQuery("from Book", Book.class);
        return query.getResultList();
    }
}
