package com.sram.web;

import com.sram.entity.Leave;
import com.sram.service.DepartmentsService;
import com.sram.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value="/leave",method={RequestMethod.GET,RequestMethod.POST})
public class LeaveController {
    @Autowired
    private LeaveService leaveservice;

    @Autowired
    private DepartmentsService departService;

    @RequestMapping("/leave")
    public String leave(Leave leave, HttpServletRequest request){
        leave.setState("未审核");
        int count = leaveservice.insert(leave);
        if(count<0){
            request.setAttribute("msg", "请假失败！");
            return "redirect:/checkin/from";
        }
        return "redirect:/checkin/leave";
    }

    @RequestMapping("/check")
    public String check(int id,HttpServletRequest request){
        Leave leave = leaveservice.selectOne(id);
        leave.setDepartments(departService.selectOne(leave.getId()));
        request.setAttribute("leave", leave);
        return "pages/checkin/check";
    }

    @RequestMapping("/update")
    public String update(Leave leave,HttpServletRequest request){
        int count = leaveservice.update(leave);
        if(count<0){
            request.setAttribute("msg", "审核失败！");
            return "redirect:/leave/check";
        }
        return "redirect:/checkin/leave";
    }

    @RequestMapping("/delete")
    public String delete(int id,HttpServletRequest request){
        int count = leaveservice.delete(id);
        if(count<0){
            request.setAttribute("msg", "删除失败！");
            return "redirect:/checkin/leave";
        }
        return "redirect:/checkin/leave";
    }
}
