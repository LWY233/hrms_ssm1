package com.sram.web;

import com.sram.entity.Departments;
import com.sram.entity.Employees;
import com.sram.service.DepartmentsService;
import com.sram.service.EmployeesService;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/department",method = {RequestMethod.GET,RequestMethod.POST})
public class DepartController {
    @Autowired
    private DepartmentsService departmentsService;
    @Autowired
    private EmployeesService employeesService;
    @RequestMapping("/search")
    public String saveAll(HttpServletRequest request){
        List<Departments> list = departmentsService.selectAll();
        PageParam pageParam = new PageParam();
        for (Departments d: list){
            Employees employees = new Employees();
            employees.setDid(d.getDid());
            pageParam.setParams(employees);
            PageResult pageResult = employeesService.getPages(pageParam);
            d.setDnum(pageResult.getTotal());
        }
        request.setAttribute("depart",list);
        return  "pages/department/right";
    }
    @RequestMapping("/depart")
    public String saveOne(Integer did,HttpServletRequest request){
        Departments departments = departmentsService.selectOne(did);
        request.setAttribute("dment",departments);
        return "pages/department/depart";
    }
    @RequestMapping("/add")
    public String add(HttpServletRequest request){
        List<Departments> list = departmentsService.selectAll();
        request.setAttribute("depart",list);
        return "pages/department/tab";
    }
    @RequestMapping("/form")
    public String form(Departments department,HttpServletRequest request){
        Departments depart = new Departments();
        depart.setDname(department.getDname());
        if(departmentsService.selectdepart(depart)==null){
            request.setAttribute("dname", "该部门名称已存在！" );
            request.setAttribute("mob", department.getMobile());
            List<Departments> list = departmentsService.selectAll();
            request.setAttribute("depart", list);
            return "pages/department/tab";
        }
        if(department.getUpperno().equals("")){
            request.setAttribute("upper", "上级部门不能为空！");
            request.setAttribute("name", department.getDname());
            request.setAttribute("mob", department.getMobile());
            List<Departments> list = departmentsService.selectAll();
            request.setAttribute("depart", list);
            return "pages/department/tab";
        }
        int count = departmentsService.insert(department);
        if(count>0){
            return "redirect:/department/search";
        }else{
            request.setAttribute("msg", "添加部门失败！");
            return "pages/department/tab";
        }
    }

    @RequestMapping("/select")
    public String select(Departments department,HttpServletRequest request){
        Departments departments = departmentsService.selectdepart(department);
        request.setAttribute("dment", departments);
        return "pages/department/depart";
    }

    @RequestMapping("/update")
    public String update(Departments department,HttpServletRequest request){
        int count = departmentsService.update(department);
        if(count>0){
            return "redirect:/department/search";
        }
        request.setAttribute("update", "修改部门失败！");
        return "redirect:/department/search";
    }

    @RequestMapping("/delete")
    public String delete(Integer did,HttpServletRequest request){
        int count = departmentsService.delete(did);
        if(count>0){
            return "redirect:/department/search";
        }
        request.setAttribute("delete", "删除部门失败！");
        return "redirect:/department/search";
    }
}
