package com.jh.service;

import com.jh.entity.Type;

import java.util.List;


public interface TypeService {
    List<Type> getAllType();
    Type getTypeById(Long id);
    Type getTypeByName(String name);
    void saveType(Type type);
    void updateType(Type type);
    void deleteType(Long id);
}
