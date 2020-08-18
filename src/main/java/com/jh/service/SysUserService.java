package com.jh.service;

import com.jh.entity.SysUser;


public interface SysUserService {

    SysUser login(String username, String password);

    SysUser findByLoginName(String username);

}
