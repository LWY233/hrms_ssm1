package com.sram.service;

import com.sram.entity.Menu;

import java.util.List;

public interface MenuService {
    public List<Menu> getAllMain(int type);

    public List<Menu> getChilds(int id, int type);
}
