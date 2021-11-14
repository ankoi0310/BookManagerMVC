package com.koi.bookmanager.service;

import com.koi.bookmanager.dao.GeneralDAO;
import com.koi.bookmanager.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookService implements GeneralService<Book> {

    private GeneralDAO<Book> bookDAO;

    @Autowired
    public BookService(GeneralDAO<Book> bookDAO) {
        this.bookDAO = bookDAO;
    }

    @Override
    @Transactional
    public List<Book> getList(int sortField) {
        return bookDAO.getList(sortField);
    }

    @Override
    @Transactional
    public void save(Book item) {
        bookDAO.save(item);
    }

    @Override
    @Transactional
    public Book get(int id) {
        return bookDAO.get(id);
    }

    @Override
    @Transactional
    public void delete(int id) {
        bookDAO.delete(id);
    }

    @Override
    @Transactional
    public List<Book> search(String keyword) {
        return bookDAO.search(keyword);
    }
}
