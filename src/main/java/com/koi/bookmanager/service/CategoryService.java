package com.koi.bookmanager.service;

import com.koi.bookmanager.dao.GeneralDAO;
import com.koi.bookmanager.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CategoryService implements GeneralService<Category> {

    private GeneralDAO<Category> categoryDAO;

    @Autowired
    public CategoryService(GeneralDAO<Category> categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @Override
    @Transactional
    public List<Category> getList(int sortField) {
        return categoryDAO.getList(sortField);
    }

    @Override
    @Transactional
    public void save(Category item) {
        categoryDAO.save(item);
    }

    @Override
    @Transactional
    public Category get(int id) {
        return categoryDAO.get(id);
    }

    @Override
    @Transactional
    public void delete(int id) {
        categoryDAO.delete(id);
    }

    @Override
    @Transactional
    public List<Category> search(String keyword) {
        return categoryDAO.search(keyword);
    }
}
