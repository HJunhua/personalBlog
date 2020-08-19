package com.jh.controller.admin;

import com.jh.config.security.UserConfig;
import com.jh.entity.SysUser;
import com.jh.service.SysUserService;
import com.jh.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/admin")
public class SysUserController {


    @Autowired
    private SysUserService userService;
//    @Autowired
//    private UserConfig userConfig;

    //跳转到登录页面，不写value默认是类上面的地址
    @GetMapping
    public String defaultPage() {
        return "admin/login";
    }
    //跳转到登录页面
    @GetMapping("/login")
    public String loginPage() {
        return "admin/login";
    }

    //用户登录操作
    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session,
                        RedirectAttributes attributes) {
        SysUser sysUser = userService.login(username, password);
        System.out.println(sysUser);
        if (sysUser != null) {
            //为了安全，session中不保存密码
            sysUser.setPassword(null);
            session.setAttribute("sysuser",sysUser);
            return "redirect:/admin/index";   // 返回后台首页
        } else {
            attributes.addFlashAttribute("message", "用户名或密码错误");
            return "redirect:/admin";
        }
    }

    @GetMapping("/index")
    public String index() {
        return "admin/index";
    }

    //用户退出登录
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("sysuser");
        return "redirect:/admin";
    }
}
