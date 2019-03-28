package com.sram.service.impl;

import com.sram.dao.DepartmentsDao;
import com.sram.entity.Departments;
import com.sram.service.DepartmentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DepartmentsServiceImpl implements DepartmentsService {
    @Autowired
    private DepartmentsDao departmentsDao;
    @Override
    public List<Departments> selectAll() {
        return departmentsDao.selectAll();
    }

    @Override
    public Departments selectOne(int did) {
        return departmentsDao.selectOne(did);
    }

    @Override
    public Departments selectdepart(Departments departments) {
        return departmentsDao.selectdepart(departments);
    }

    @Override
    public int insert(Departments departments) {
        return departmentsDao.insert(departments);
    }

    @Override
    public int update(Departments departments) {
        return departmentsDao.update(departments);
    }

    @Override
    public int delete(int did) {
        return departmentsDao.delete(did);
    }
}
