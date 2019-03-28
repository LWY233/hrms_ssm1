package com.sram.web;


import com.sram.entity.Employees;
import com.sram.entity.Money;
import com.sram.entity.Users;
import com.sram.service.EmployeesService;
import com.sram.service.MoneyService;
import com.sram.service.TaxService;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value="/money",method=RequestMethod.GET)
public class MoneyController {
	
	@Autowired
	private MoneyService moneyservice;
	@Autowired
	private EmployeesService employeesservice;
	@Autowired
	private TaxService taxservice;
	
	@RequestMapping(value="/show",method={RequestMethod.GET,RequestMethod.POST})
	public String demo(HttpServletRequest request, ModelMap model, Employees employees, Money money, Integer page, Integer pagesize){
		Users user = (Users) request.getSession().getAttribute("loginUser");
		if(user.getUserType()==3){
			employees.setEid(user.getEid());
			employees = employeesservice.getEmployeesByEid(user.getEid());
		}
		request.getSession().setAttribute("employees", employees);
		request.getSession().setAttribute("money", money);
		PageParam page_param = new PageParam();
		page_param.setPage(page==null?1:page);
		page_param.setPageSize(pagesize==null?3:pagesize);
		money.setEmployees(employees);
		page_param.setParams(money);
		
		PageResult page_result = moneyservice.getPages(page_param);

		
		model.addAttribute("datas",page_result);		//页面上取值  循环 ${datas.data}
		return "pages/moneys/showmoney";
	}
	
	@RequestMapping(value="/add")
	public String addmoney(){
		return "admin/moneys/addmoney";
	}
	@RequestMapping(value="/form",method={RequestMethod.GET,RequestMethod.POST})
	public String form(HttpServletRequest request, ModelMap model, Employees employees, Money money){
		employees = employeesservice.getEmployeesByEmployees(employees);
		if(employees ==null){
			request.setAttribute("msg", "没有该员工！");
			return "pages/moneys/addmoney";
		}
		money.setEid(employees.getEid());
		Money m = new Money();
		m = moneyservice.getmoneyByMoney(money);
		if(m!=null){
			request.setAttribute("msg", "该月员工已经存在薪资表！");
			return "pages/moneys/addmoney";
		}else{
			money.setQqmoney(0F);
			money.setRapall(0F);
			Float moneyall = money.getBasemoney()+money.getQqmoney()+money.getRapall()+money.getSubsidization()+money.getWorkOvertime();
			Float pay = taxservice.num(moneyall);
			money.setPayment(pay);
			money.setRealityMoney(moneyall-pay);
			if(moneyservice.insertMoney(money)<=0){
				request.setAttribute("msg", "插入失败请重新插入！");
				return "pages/moneys/addmoney";
			}
			
		}
		return "redirect:/money/show";
	}
	
	@RequestMapping(value="/update")
	public String update(int mid,HttpServletRequest request){

		 Money money =  moneyservice.getmoney(mid);
		 request.setAttribute("money", money);
		return "pages/moneys/showAndUpdate";
	}
	
	@RequestMapping(value="/form2",method={RequestMethod.GET,RequestMethod.POST})
	public String form2(HttpServletRequest request, ModelMap model, Money money){
		Float moneyall = money.getBasemoney()+money.getQqmoney()+money.getRapall()+money.getSubsidization()+money.getWorkOvertime();
		Float pay = taxservice.num(moneyall);
		money.setPayment(pay);
		money.setRealityMoney(moneyall-pay);
		
		
		if(moneyservice.updatemoney(money)<=0){
			request.setAttribute("msg", "修改失败！");
			int mid = money.getMid(); 
			money =  moneyservice.getmoney(mid);
			 request.setAttribute("money", money);
			return "pages/moneys/showAndUpdate";
		}
		
		return "redirect:/money/show";
	}

}
