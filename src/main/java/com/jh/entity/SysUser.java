package com.jh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author lize
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysUser {

    /**编号*/
    private Long id;

    /**昵称*/
    private String nickname;

    /**用户名*/
    private String username;

    /**密码*/
    private String password;

    /**邮箱地址*/
    private String email;

    /**头像地址*/
    private String avatar;

    /**用户类型*/
    private Integer type;

    /**创建时间*/
    private Date createTime;

    /**更新时间*/
    private Date updateTime;


    /**级联关系*/
    private List<Blog> blogs = new ArrayList<>();

}
