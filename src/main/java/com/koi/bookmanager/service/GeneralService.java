package com.koi.bookmanager.service;

import java.util.List;

public interface GeneralService<T> {
    List<T> getList(int sortField);
    void save(T item);
    T get(int id);
    void delete(int id);
    List<T> search(String keyword);
}
