package com.sram.web;


import com.sram.entity.Employees;
import com.sram.entity.RewardAndPunish;
import com.sram.entity.Users;
import com.sram.service.EmployeesService;
import com.sram.service.RapService;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value="/rap",method=RequestMethod.GET)
public class RapController {
	
	@Autowired
	private RapService rapservice;
	@Autowired
	private EmployeesService employeesservice;

	
	@RequestMapping(value="/show",method={RequestMethod.GET,RequestMethod.POST})
	public String demo(HttpServletRequest request, ModelMap model, Employees employees, RewardAndPunish rap, Integer page, Integer pagesize){
		Users user = (Users) request.getSession().getAttribute("loginUser");
		if(user.getUserType()==3){
			//employees.setEno(user.getUno());
			employees = employeesservice.getEmployeesByEid(user.getEid());
		}
		request.getSession().setAttribute("employees", employees);
		request.getSession().setAttribute("rap", rap);
		PageParam page_param = new PageParam();
		page_param.setPage(page==null?1:page);
		page_param.setPageSize(pagesize==null?3:pagesize);
		rap.setEmployees(employees);
		page_param.setParams(rap);
		
		PageResult page_result = rapservice.getPages(page_param);
		
		model.addAttribute("datas",page_result);		//页面上取值  循环 ${datas.data}
		return "pages/rewardAndPunish/showRap";
	}
	@RequestMapping(value="/add")
	public String addrap(){
		return "pages/rewardAndPunish/addRap";
	}
	@RequestMapping(value="/form",method={RequestMethod.GET,RequestMethod.POST})
	public String form(HttpServletRequest request, Employees employees, RewardAndPunish rap){
		if(rap.getPunishment()!=null && rap.getReward()!=null){
			request.setAttribute("msg", "奖金罚金不能同时存在一个表中！");
			return "pages/rewardAndPunish/addRap";
		}
		 
		employees = employeesservice.getEmployeesByEmployees(employees);
		System.out.println(11);
		if(employees ==null){
			request.setAttribute("msg", "没有该员工！");
			return "pages/rewardAndPunish/addRap";
		}
		rap.setEid(employees.getEid());
		rap.setEmployees(employees);
		int eyear = Integer.parseInt(employees.getHiredate().split("-")[0]);
		int ryear = Integer.parseInt(rap.getMonth().split("-")[0]);
		int emonth =0;
		int rmonth =0;
		String emonth1 = employees.getHiredate().split("-")[1];
		if(emonth1.charAt(0)=='0'){
			emonth = Integer.parseInt(emonth1.substring(1));
		}else{
			emonth = Integer.parseInt(employees.getHiredate().split("-")[1]);
		}
		
		
		String rmonth1 = rap.getMonth().split("-")[1];
		if(rmonth1.charAt(0)=='0'){
			rmonth = Integer.parseInt(rmonth1.substring(1));
		}else{
			rmonth = Integer.parseInt(rap.getMonth().split("-")[1]);
		}
		 
		
		if(eyear>ryear){
			request.setAttribute("msg", "该员工还没有入职！");
			return "pages/rewardAndPunish/addRap";
		}else if(eyear== ryear && emonth>rmonth){
			request.setAttribute("msg", "该员工还没有入职！");
			return "pages/rewardAndPunish/addRap";
		}else{
			int i = rapservice.insertrap(rap);
			if(i==1){
				return "redirect:/rap/show";
			}else if(i ==2){
				request.setAttribute("msg", "该用户已经发放工资不可添加将罚金");
				return "pages/rewardAndPunish/addRap";
			}else{
				request.setAttribute("msg", "添加失败");
				return "pages/rewardAndPunish/addRap";
			}
		}
	}
	
	@RequestMapping(value="/update")
	public String update(int id,HttpServletRequest request){
		System.out.println(id);

		RewardAndPunish rap =  rapservice.getrap(id);
		 request.setAttribute("rap", rap);
		return "admin/rewardAndPunish/updateRap";
	}
	
	@RequestMapping(value="/form2",method={RequestMethod.GET,RequestMethod.POST})
	public String form2(HttpServletRequest request, RewardAndPunish rap, String beforedate){
		String msg1 = rapservice.updaterap(rap,beforedate);
		String [] msg = msg1.split("-");
		if(msg[0].equals("0")){
			request.setAttribute("msg", "修改失败！");
			return "admin/rewardAndPunish/updateRap";
		}else {
			return "redirect:/rap/show";
		}
		
		
		
		
		
		
//		Float moneyall = money.getBasemoney()+money.getQqmoney()+money.getRapall()+money.getSubsidization()+money.getWorkOvertime();
//		Float pay = taxservice.num(moneyall);
//		money.setPayment(pay);
//		money.setRealityMoney(moneyall-pay);
//		
//		
//		if(moneyservice.updatemoney(money)<=0){
//			request.setAttribute("msg", "修改失败！");
//			int mid = money.getMid();
//			money =  moneyservice.getmoney(mid);
//			 request.setAttribute("money", money);
//			return "admin/moneys/showAndUpdate";
//		}
//		
//		return "redirect:/money/show";
	}
}
