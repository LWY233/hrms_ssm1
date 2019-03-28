package com.sram.service.impl;

import com.sram.dao.MenuDao;
import com.sram.entity.Menu;
import com.sram.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDao menuDao;
    @Override
    public List<Menu> getAllMain(int type) {
        return menuDao.getAll(type);
    }

    @Override
    public List<Menu> getChilds(int id, int type) {
        return menuDao.getChilds(id,type);
    }
}
