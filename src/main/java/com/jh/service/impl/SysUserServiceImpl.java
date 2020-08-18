package com.jh.service.impl;

import com.jh.entity.SysUser;
import com.jh.mapper.SysUserMapper;
import com.jh.service.SysUserService;
import com.jh.util.MD5Util;
import com.jh.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserMapper userMapper;

    @Transactional
    @Override
    public SysUser login(String username, String password) {
        return userMapper.login(username, MD5Util.getMD5(password));
    }

    @Transactional
    @Override
    public SysUser findByLoginName(String username) {
        return userMapper.findByLoginName(username);
    }
}
