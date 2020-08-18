package com.jh.service;

import com.jh.entity.Type;

import java.util.List;


public interface TypeService {
    public List<Type> getAllType();
    public Type getTypeById(Long id);
    public Type getTypeByName(String name);
    public void saveType(Type type);
    public void updateType(Type type);
    public void deleteType(Long id);
}
