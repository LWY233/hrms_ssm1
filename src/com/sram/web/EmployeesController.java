package com.sram.web;

import com.sram.entity.Departments;
import com.sram.entity.Employees;
import com.sram.entity.Users;
import com.sram.service.DepartmentsService;
import com.sram.service.EmployeesService;
import com.sram.service.UserService;
import com.sram.util.EncryptUtil;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 员工信息Controller
 */
@Controller
@RequestMapping(value = "/employees",method = {RequestMethod.GET,RequestMethod.POST})
public class EmployeesController {
    /**
     * 员工信息Service
     */
    @Autowired
    private EmployeesService employeesService;
    /**
     * 部门信息Service
     */
    @Autowired
    private DepartmentsService departService;
    /**
     * 用户Service
     */
    @Autowired
    private UserService usersServcie;


    @RequestMapping("/add")
    public String add(HttpServletRequest request){
        List<Departments> list = departService.selectAll();
        request.setAttribute("depart", list);
        return "pages/employees/tab";
    }

    @RequestMapping("/search")
    public String search(ModelMap model, Employees employees, Integer page, Integer pagesize, HttpServletRequest request){
        request.getSession().setAttribute("employees", employees);  //记录下来，模糊查询分页

        PageParam page_param = new PageParam();
        page_param.setPage(page==null?1:page);
        page_param.setPageSize(pagesize==null?10:pagesize);
        page_param.setParams(employees);

        PageResult page_result = employeesService.getPages(page_param);
        model.addAttribute("datas",page_result);
        return "pages/employees/right";
    }

    @RequestMapping("/delete")
    public String delete(String eno,HttpServletRequest request){
        int count = employeesService.delete(eno);
        if(count<0){
            request.setAttribute("delete", "删除人员失败！");
            return "redirect:/department/search";
        }
        return "redirect:/employees/search";
    }

    @RequestMapping("/employ")
    public String employ(String eno,HttpServletRequest request){
        Employees employees = employeesService.selectOne(eno);
        request.setAttribute("employ", employees);
        return "pages/employees/employ";
    }

    @RequestMapping("/select")
    public String select(Employees employees,HttpServletRequest request){
        Employees employee = employeesService.selectemploy(employees);
        request.setAttribute("employ", employee);
        return "pages/employees/employ";
    }

    @RequestMapping("/update")
    public String update(Employees employees,HttpServletRequest request){
        int count = employeesService.update(employees);
        if(count<0){
            request.setAttribute("update", "修改人员失败！");
            return "redirect:/employees/search";
        }
        return "redirect:/employees/search";
    }

    @RequestMapping("/form")
    public String form(Employees employees,HttpServletRequest request){
        Users user = new Users();
        user.setUno(employees.getEname());
        user.setUserType(3);
        user.setPassword(EncryptUtil.encrypt("123456"));
        Departments depart = departService.selectOne(employees.getDid());
        employees.setUpperno(depart.getUpperno());
        List<Employees> liste = employeesService.selectDepart(employees.getDid());
        if(liste.size()==0){
            employees.setEno(employees.getDid()+"-"+1);
        }else{
            employees.setEno(employees.getDid()+"-"+liste.get(liste.size()-1).getEid()+1);
        }
        int num = usersServcie.insert(user);
        List<Users> listu = usersServcie.selectALL();
        employees.setUid(listu.get(listu.size()-1).getUid());
        int count = employeesService.insert(employees);
        user.setEid(employeesService.selectOne(employees.getEno()).getEid());
        user.setUid(employeesService.selectOne(employees.getEno()).getUid());
        int cou = usersServcie.update(user);
        if(count + num + cou != 3){
            request.setAttribute("msg", "添加员工失败!");
            return "pages/employees/tab";
        }
        return "redirect:/employees/search";
    }
}
