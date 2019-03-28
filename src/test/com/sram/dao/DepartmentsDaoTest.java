package com.sram.dao;

import com.sram.entity.Departments;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-*.xml"})
public class DepartmentsDaoTest {

    @Autowired
    private DepartmentsDao departmentsDao;
    @Test
    @Ignore
    public void selectAll(){
        List<Departments> departmentsList = departmentsDao.selectAll();
        assertEquals(10,departmentsList.size());
    }
    @Test
    @Ignore
    public void selectOne(){
        Departments departments = departmentsDao.selectOne(7);
        assertEquals("人事部",departments.getDname());
    }
    @Test
    @Ignore
    public void selectdepart(){
        Departments depart = new Departments();
        depart.setDid(7);
        depart.setDname("人事部");
        Departments departments = departmentsDao.selectdepart(depart);
        assertEquals("人事部",departments.getDname());
    }
    @Test
    @Ignore
    public void insert(){
        Departments departments = new Departments();
        departments.setDname("c#开发");
        departments.setUpperno("研发部");
        departments.setMobile("13041491655");
        int effectNum = departmentsDao.insert(departments);
        assertEquals(1,effectNum);
    }
    @Test
    @Ignore
    public void update(){
        Departments departments = new Departments();
        departments.setDid(11);
        departments.setMobile("15773281531");
        int effectNum = departmentsDao.update(departments);
        assertEquals(1,effectNum);
    }
    @Test
    @Ignore
    public void delete(){
        int effectNum = departmentsDao.delete(11);
        assertEquals(1,effectNum);
    }
}