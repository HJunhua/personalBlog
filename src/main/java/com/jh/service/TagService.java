package com.jh.service;

import com.jh.entity.Tag;

import java.util.List;


public interface TagService {
    List<Tag> getAllTag();
    Tag getTagById(Long id);
    Tag getTagByName(String name);
    void saveTag(Tag tag);
    void updateTag(Tag tag);
    void deleteTag(Long id);

}
