package com.jh.mapper;

import com.jh.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
@Mapper
public interface SysUserMapper {
    SysUser login(@Param("username") String username, @Param("password") String password);

    SysUser findByLoginName(@Param("username") String username);
}
