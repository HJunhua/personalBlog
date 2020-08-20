package com.jh.service;

import com.jh.entity.Comment;

import java.util.List;


public interface CommentService {
    void saveComment(Comment comment);
    List<Comment> getCommentByBlogId(Long blogId);
}
