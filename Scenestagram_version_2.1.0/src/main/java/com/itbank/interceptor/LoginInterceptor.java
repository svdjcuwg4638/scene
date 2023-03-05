package com.itbank.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itbank.model.UsersDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UsersDTO login = (UsersDTO)session.getAttribute("login");
		
		String url = request.getRequestURL().toString();
		url = URLEncoder.encode(url, "utf-8");
		
		if(login == null) {
			System.out.println("인터셉터 작동!!");
			response.sendRedirect(request.getContextPath() + "/users/login?url=" + url);
			return false;
		}

		return true;
	}
	
}
