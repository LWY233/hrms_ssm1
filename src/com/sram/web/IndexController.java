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

/**
 * 主页的Controller
 */
@Controller
public class IndexController {
	/**
	 * 用户service
	 */
	@Autowired
	private UserService usersservice;
	/**
	 * 请假service
	 */
	@Autowired
	private LeaveService leaveservice;
	/**
	 * 部门service
	 */
	@Autowired
	private DepartmentsService departService;
	/**
	 * 员工service
	 */
	@Autowired
	private EmployeesService employeesService;

	/**
	 * 跳转用户登录页面
	 * @return
	 */
	@RequestMapping("/")
	public String adminLogin(){
		return "pages/login";
	}

	/**
	 * 跳转到首页
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/admin")
	public String admin(ModelMap model) throws Exception{
		//加载首页的数据
		return "pages/main";
	}

	/**
	 * 用户登录验证
	 * @param uno
	 * @param password
	 * @param request
	 * @return
	 */
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

	/**
	 * 跳转主页
	 * @return
	 */
	@RequestMapping("/index")
	public String top(){
		return "pages/index";
	}

	/**
	 * 错误页
	 * @return
	 */
	@RequestMapping("/error")
	public String error(){
		return "pages/error";
	}

	/**
	 * 跳转登出页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("loginUser");
		return "redirect:/";
	}
}
