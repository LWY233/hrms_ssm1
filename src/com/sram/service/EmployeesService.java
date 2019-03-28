package com.sram.service;

import com.sram.entity.Employees;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;

import java.util.List;

public interface EmployeesService {
    public Employees selectOne(String eno);

    public List<Employees> selectAll();

    public List<Employees> selectDepart(int did);

    public int update(Employees employees);

    public int insert(Employees employees);

    public int delete(String eno);

    public PageResult getPages(PageParam param);

    public Employees selectemploy(Employees employees);

    public Employees getEmployeesByEno(String eno);

    public Employees getEmployeesByEmployees(Employees employees);

    public Employees getEmployeesByEid(int eid);
}
