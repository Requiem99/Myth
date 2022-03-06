package com.dwg.filter;

import org.springframework.context.annotation.ComponentScan;

import javax.servlet.*;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebFilter("/*")
public class NoLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("过滤器开启！");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        //String uri="";
        if (session.getAttribute("user")==null){
            if (req.getServletPath().contains("addWishList")){
                    resp.sendRedirect("login.jsp");
            }else{
                chain.doFilter(req,resp);
            }
            chain.doFilter(req,resp);
        }
        chain.doFilter(req,resp);

    }

    @Override
    public void destroy() {
        System.out.println("过滤器关闭！");
    }
}
