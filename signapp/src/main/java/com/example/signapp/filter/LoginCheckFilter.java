package com.example.signapp.filter;

import java.io.IOException;
import java.net.http.HttpResponse;
import jakarta.servlet.Filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter
public class LoginCheckFilter implements Filter {
	 public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
		        throws IOException, ServletException {
		 
		 // 캐스팅 
		 HttpServletRequest req = (HttpServletRequest) request;
		 HttpServletResponse res = (HttpServletResponse) response;
		 String uri = req.getRequestURI();
		 
		 // 로그인, 회원가입, 나머지 예외처리
		 if (uri.contains("/login") || uri.contains("/join")) {
	            chain.doFilter(request, response);
	            return;
	        }
		 // 로그인 여부 확인
		 HttpSession session = req.getSession(false);
		 boolean isLogin = session != null && session.getAttribute("loginEmployee") != null;
		 
		 // 로그인 안된 경우 + 메세지 + 로그인페이지로
		 if(!isLogin) {
			 res.sendRedirect("/login?msg=needLogin");
			 return;
		 }
		 
		 // 로그인 된 경우
		 chain.doFilter(request, response);
	 }
}
