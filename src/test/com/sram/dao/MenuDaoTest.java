package com.sram.dao;

import com.sram.entity.Menu;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-*.xml"})
public class MenuDaoTest {

    @Autowired
    private MenuDao menuDao;
    @Test
    public void getAll(){

        List<Menu> menuList = menuDao.getAll(1);
        assertEquals(7,menuList.size());
    }
    @Test
    public void getChilds(){

    }
}