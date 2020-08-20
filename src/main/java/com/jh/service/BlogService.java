package com.jh.service;

import com.jh.entity.Blog;

import java.util.List;
import java.util.Map;


public interface BlogService {
    List<Blog> getAllBlog();
    void saveBlog(Blog blog);
    Blog getBlogById(Long id);
    void deleteBlog(Long id);
    void updateBlog(Blog blog);
    List<Blog> searchBlog(Blog blog);


    Integer countBlog();
    Map<String, List<Blog>> archiveBlog();


    List<Blog> getBlogByTypeId(Long typeId);
    List<Blog> getBlogByTagId(Long tagId);


    List<Blog> getIndexBlog();
    List<Blog> getRecommendBlog();
    List<Blog> searchIndexBlog(String query);
    Blog getDetailedBlog(Long id);


}
