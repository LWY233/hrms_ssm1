package com.sram.interceptor;

import com.sram.entity.Menu;
import com.sram.entity.Users;
import com.sram.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class LoginInterceptor implements HandlerInterceptor{

	@Autowired
	private MenuService menuservice;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
//		if(request.getServletPath().equals("/")){
//			return true;
//		}
//		System.out.println(request.getServletPath()+"\n"+request.getContextPath());
		Users user = (Users)request.getSession().getAttribute("loginUser");
		if(user!=null){
			int type = user.getUserType();
			String urls[] = request.getServletPath().split("/");
			String url = request.getServletPath();
			request.setAttribute("url", url.substring(1,url.length()));
			request.setAttribute("urlmain", urls.length>1?urls[1]:urls[0]);
			//加载资源   加载后台的菜单
			List<Menu> menus = menuservice.getAllMain(type);
			for(Menu m : menus){
				m.setChilds(menuservice.getChilds(m.getMid(),type));
			}
			request.setAttribute("menus", menus);
			return true;
		}else{
			response.sendRedirect(request.getContextPath()+"/");
		}
		return false;
	}
	
}
