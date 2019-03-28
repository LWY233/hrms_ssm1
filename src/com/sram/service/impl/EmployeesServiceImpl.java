package com.sram.service.impl;

import com.sram.dao.DepartmentsDao;
import com.sram.dao.EmployeesDao;
import com.sram.entity.Employees;
import com.sram.service.EmployeesService;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmployeesServiceImpl implements EmployeesService {
    @Autowired
    private EmployeesDao employeesDao;
    @Autowired
    private DepartmentsDao departmentsDao;
    @Override
    public Employees selectOne(String eno) {
        Employees employees = employeesDao.selectOne(eno);
        employees.setDepartments(departmentsDao.selectOne(employees.getDid()));
        return employees;
    }

    @Override
    public List<Employees> selectAll() {
        return employeesDao.selectAll();
    }

    @Override
    public List<Employees> selectDepart(int did) {
        return employeesDao.selectDepart(did);
    }

    @Override
    public int update(Employees employees) {
        return employeesDao.update(employees);
    }

    @Override
    public int insert(Employees employees) {
        return employeesDao.insert(employees);
    }

    @Override
    public int delete(String eno) {
        return employeesDao.delete(eno);
    }

    @Override
    public PageResult getPages(PageParam param) {
        PageResult pageResult = new PageResult();
        if(param.getPageSize() != null && param.getPage() != null){
            pageResult.setPageSize(param.getPageSize());
            pageResult.setPage(param.getPage());
            param.setPage((param.getPage() - 1) * param.getPageSize());

        }
        List<Employees> employees = employeesDao.page(param);
        for(Employees e : employees){
            e.setDepartments(departmentsDao.selectOne(e.getDid()));
        }
        pageResult.setData(employees);

        param.setPage(null);//手动设置page为null，查询所有的user记录
        pageResult.setTotal(employeesDao.page(param).size());
        if(param.getPageSize() != null){
            pageResult.setTotalPage((int)Math.ceil((double)pageResult.getTotal() / pageResult.getPageSize()));
        }
        return pageResult;
    }

    @Override
    public Employees selectemploy(Employees employees) {
        Employees employees1 = employeesDao.selectemploy(employees);
        try {
            employees1.setDepartments(departmentsDao.selectOne(employees1.getDid()));
        }catch (NullPointerException e){
            System.out.println("NullPointerException发生了");
        }
        return employees1;
    }

    @Override
    public Employees getEmployeesByEno(String eno) {
        return employeesDao.getEmployeesByEno(eno);
    }

    @Override
    public Employees getEmployeesByEmployees(Employees employees) {
        List<Employees> employeesList = employeesDao.getEmployeesByEmployees(employees);
        if(employeesList.size() <= 0){
            return null;
        }
        return employeesList.get(0);
    }

    @Override
    public Employees getEmployeesByEid(int eid) {
        return employeesDao.getEmployees(eid);
    }
}
