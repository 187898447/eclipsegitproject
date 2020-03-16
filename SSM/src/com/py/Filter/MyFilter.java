package com.py.Filter;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class MyFilter
 */
public class MyFilter implements Filter {

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest requests = (HttpServletRequest)request;
		HttpSession session = requests.getSession();
		HttpServletResponse responses = (HttpServletResponse)response;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String name = (String)session.getAttribute("adminname");
		String name2 = (String)session.getAttribute("username");
		String url = requests.getRequestURL().toString();
		if((name!=null) || (name2!=null) || url.endsWith("getpwd.jsp")) {
			chain.doFilter(request, response);
		}else {
			responses.sendRedirect("MyServlet");
		}
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
