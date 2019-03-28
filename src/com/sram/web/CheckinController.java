package com.sram.web;

import com.sram.entity.Departments;
import com.sram.entity.Leave;
import com.sram.service.DepartmentsService;
import com.sram.service.LeaveService;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/checkin",method = {RequestMethod.GET,RequestMethod.POST})
public class CheckinController {
    @Autowired
    private DepartmentsService departmentsService;
    @Autowired
    private LeaveService leaveService;
    @RequestMapping("form")
    public String form(HttpServletRequest request){
        List<Departments> list = departmentsService.selectAll();
        request.setAttribute("depart",list);
        return "pages/checkin/form";
    }

    @RequestMapping("leave")
    public String leave(ModelMap modelMap, Leave leave,Integer page,Integer pageSize){
        PageParam pageParam = new PageParam();
        pageParam.setPage(page == null ?1:page);
        pageParam.setPageSize(pageSize == null ? 10:pageSize);
        pageParam.setParams(leave);

        PageResult pageResult = leaveService.getPages(pageParam);
        modelMap.addAttribute("datas",pageResult);
        return "pages/checkin/right";

    }
}
