package com.koi.bookmanager.dao;

import java.util.List;

public interface GeneralDAO<T> {
    List<T> getList(int sortField);
    void save(T item);
    T get(int id);
    void delete(int id);
    List<T> search(String keyword);
}
