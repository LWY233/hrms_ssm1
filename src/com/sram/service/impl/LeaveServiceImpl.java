package com.sram.service.impl;

import com.sram.dao.DepartmentsDao;
import com.sram.dao.LeaveDao;
import com.sram.entity.Leave;
import com.sram.service.LeaveService;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeaveServiceImpl implements LeaveService {
    @Autowired
    private LeaveDao leaveDao;
    @Autowired
    private DepartmentsDao departmentsDao;
    @Override
    public int insert(Leave leave) {
        return leaveDao.insert(leave);
    }

    @Override
    public int update(Leave leave) {
        return leaveDao.update(leave);
    }

    @Override
    public int delete(int id) {
        return leaveDao.delete(id);
    }

    @Override
    public Leave selectOne(int id) {
        return leaveDao.selectOne(id);
    }

    @Override
    public List<Leave> selectAll() {
        return leaveDao.selectAll();
    }

    @Override
    public Leave select(Leave leave) {
        return leaveDao.select(leave);
    }

    @Override
    public PageResult getPages(PageParam param) {
        PageResult pageResult = new PageResult();
        pageResult.setPageSize(param.getPageSize());
        pageResult.setPage(param.getPage());

        param.setPage((param.getPage() - 1) * param.getPageSize());
        List<Leave> leaves = leaveDao.page(param);
        for(Leave l : leaves){
            l.setDepartments(departmentsDao.selectOne(l.getDepartmentid()));
        }
        pageResult.setData(leaves);
        param.setPage(null);
        pageResult.setTotal(leaveDao.page(param).size());
        pageResult.setTotalPage((int)Math.ceil(((double)pageResult.getTotal() / pageResult.getPageSize())));

        return pageResult;
    }
}
