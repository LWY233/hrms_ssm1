package com.sram.web;

import com.sram.entity.Departments;
import com.sram.entity.Employees;
import com.sram.entity.Leave;
import com.sram.entity.Users;
import com.sram.service.DepartmentsService;
import com.sram.service.EmployeesService;
import com.sram.service.LeaveService;
import com.sram.service.UserService;
import com.sram.util.EncryptUtil;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class IndexController {
	
	@Autowired
	private UserService usersservice;
	
	@Autowired
	private LeaveService leaveservice;
	
	@Autowired
	private DepartmentsService departService;
	
	@Autowired
	private EmployeesService employeesService;
	
	@RequestMapping("/")
	public String adminLogin(){
		return "pages/login";
	}	
	
	@RequestMapping("/admin")
	public String admin(ModelMap model) throws Exception{
		//加载首页的数据
		return "pages/main";
	}
	
	@RequestMapping("/login")
	public String main(String uno,String password,HttpServletRequest request){
		Users user = null;
		if(password!=null){
			String passwords = EncryptUtil.encrypt(password);
			user = usersservice.selectone(uno, passwords);
		}
		if(user == null){
			request.setAttribute("msg", "密码或账号有误！请重新输入！");
			return "pages/login";
		}else{

			request.getSession().setAttribute("loginUser", user);
			return "redirect:/admin";
		}
		//sfasfsafsafsaf
	}
	
	@RequestMapping("/left")
	public String left(){
		return "pages/left";
	}
	
	@RequestMapping("/top")
	public String right(){
		return "pages/top";
	}
	
	@RequestMapping("/default")
	public String defaultl(HttpServletRequest request){
		List<Departments> list = departService.selectAll();
		PageParam page_param = new PageParam();
		int num = 0;
		for(Departments d : list){
			Employees employees = new Employees();
			employees.setDid(d.getDid());
			page_param.setParams(employees);
			PageResult page_result = employeesService.getPages(page_param);
			d.setDnum(page_result.getTotal());
			num = num + page_result.getTotal();
		}
		request.setAttribute("depart", list);
		request.setAttribute("num", num);
		List<Leave> leave = leaveservice.selectAll();
		for(Leave l : leave){
			l.setDepartments(departService.selectOne(l.getDepartmentid()));
		}
		request.setAttribute("leave", leave);
		return "pages/default";
	}
	
	@RequestMapping("/imgtable")
	public String imgtable(){
		return "pages/imgtable";
	}
	
	@RequestMapping("/index")
	public String top(){
		return "pages/index";
	}
	
	@RequestMapping("/error")
	public String error(){
		return "pages/error";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("loginUser");
		return "redirect:/";
	}
}
