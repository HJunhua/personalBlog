package com.jh.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserConfig userConfig;

    @Autowired
    private PasswordEncoder passwordEncoder;

    //认证
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                //用户认证处理
                .userDetailsService(userConfig)
                //密码处理
                .passwordEncoder(passwordEncoder);
    }



    //授权
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                //关闭csrf防护
                .csrf().disable()
                //去除 Secure Header 和 X-Frame-Options
                .headers().frameOptions().disable().
                and();

        http
                .formLogin()
                // 登录页面
                .loginPage("/admin/login")
                .successForwardUrl("/admin/login")
                .failureForwardUrl("/admin/login")
                .permitAll()
                .and();

        http
                //登出处理
                .logout()
                .logoutUrl("/admin/logout")
                .logoutSuccessUrl("/admin/")
                .permitAll()
                .and();

        http
                //定制url访问权限
                .authorizeRequests()
                //无须权限访问
                .antMatchers("/","/*","/footer/newblog","/blog/*","/comments/*","/tags/*","/types/*","/admin/login","/css/**","/js/**","/images/**").permitAll()
                //其他接口需要登录访问
                .anyRequest().authenticated()
                .and();

        http
                //开启记住我W
                .rememberMe()
                .tokenValiditySeconds(604800) //七天
                /*.tokenRepository(persistentTokenRepository())
                .userDetailsService(userConfig)*/
                .rememberMeParameter("remember")
                .and();

    }

}
