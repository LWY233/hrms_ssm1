package com.sram.web;

import com.sram.entity.Users;
import com.sram.service.UserService;
import com.sram.util.EncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value="/users",method={RequestMethod.GET,RequestMethod.POST})
public class UsersController {
	
	@Autowired
	private UserService usersService;
	
	@RequestMapping("/update")
	public String update(String pwd, Users user, HttpServletRequest request){
		String pword = EncryptUtil.encrypt(pwd);
		Users user1 = (Users)request.getSession().getAttribute("loginUser");
		if(pword.equals(user1.getPassword())){
			
		}else{ 
			request.setAttribute("msg", "原始密码错误！");
			return "pages/users/modify";
		}
		user.setPassword(EncryptUtil.encrypt(user.getPassword()));
		int count = usersService.update(user);
		if(count<0){
			request.setAttribute("msg", "修改密码失败！");
		}
		return "pages/index";
	}
	
	@RequestMapping("/modify")
	public String modify(){
		return "admin/users/modify";
	}
}
