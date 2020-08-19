package com.jh.config.security;

import com.jh.entity.SysUser;
import com.jh.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户登陆认证
 */
@Component
public class UserConfig  implements UserDetailsService {

    @Autowired
    private SysUserService sysUserService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //查询用户
        SysUser sysUser = sysUserService.findByLoginName(username);

        //查询权限
        /*List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(sysUser.getRoles()));*/
        StringBuilder authorities = new StringBuilder();
        authorities.append("ROLE_admin");

        //查无此用户
        if(StringUtils.isEmpty(sysUser.getId())) {
            sysUser.setUsername("查无此用户");
            sysUser.setPassword("查无此用户");
        }

        //封装用户信息
        return new User(sysUser.getUsername(), sysUser.getPassword(), AuthorityUtils.commaSeparatedStringToAuthorityList(authorities.toString())); //将String转换为List<GrantedAuthority>
    }
}
