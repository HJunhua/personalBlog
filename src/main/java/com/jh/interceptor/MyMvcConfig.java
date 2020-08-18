package com.jh.interceptor;


public class MyMvcConfig {/* implements WebMvcConfigurer {
    // 配置页面url
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("admin");
        registry.addViewController("/admin.html").setViewName("admin");
    }

    // 配置拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginHandleInterceptor())  // 添加一个拦截器
                .addPathPatterns("/**") // 添加过滤所有请求
                .excludePathPatterns("/admin","/","/admin/login","/css/**","/js/**","/img/**"); // 排除哪些请求,这里是登录页面请求不能被拦住,静态资源请求不能被拦截
    }*/
}
/*import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


*//**
 * @author lize
 *//*
@Configuration
public class MyMvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginHandleInterceptor())
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin")
                .excludePathPatterns("/admin/login");
    }
}*/
