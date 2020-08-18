package com.jh.interceptor;


/**
 * @author lize
 */
public class LoginHandleInterceptor {/* extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        // 登录成功后，应该有用户的session
        Object loginUser = request.getSession().getAttribute("loginUser");
        // 如果没有登录，就拦截，并转发
        if(loginUser == null) {
            *//*request.setAttribute("msg","没有权限，请先登录");*//*
            response.sendRedirect("/admin");
            return false;
        } else {
            return true;
        }

        *//*if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/admin");
            return false;
        }
        return true;*//*
    }*/
}
