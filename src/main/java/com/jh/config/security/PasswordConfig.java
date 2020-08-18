package com.jh.config.security;

import com.jh.util.MD5Util;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * 密码校对
 */
@Component
public class PasswordConfig implements PasswordEncoder {
    @Override
    public String encode(CharSequence charSequence) {
        return MD5Util.getMD5(charSequence.toString());
    }

    @Override
    public boolean matches(CharSequence charSequence, String password) {
        System.out.println(charSequence);
        System.out.println(password);
        return password.contentEquals(encode(charSequence));
    }

    /**
     *
     * @param charSequence 用户输入的密码
     * @return
     */
    /*@Override
    public String encode(CharSequence charSequence) {
        // 将charSequence加密，并返回
        return MD5Util.getMD5(charSequence.toString());
    }

    *//**
     *
     * @param charSequence 用户输入的密码
     * @param password 数据库中的密码
     * @return
     *//*
    @Override
    public boolean matches(CharSequence charSequence, String password) {
        System.out.println(charSequence);
        System.out.println(password);
        System.out.println(MD5Util.getMD5(charSequence.toString()));
        // 将数据库中的密码 和 charSequence加密后的密码 比较，并返回
        return password.contentEquals(encode(charSequence));
    }*/
}
