package com.sram.service;

import com.sram.entity.Users;

import java.util.List;

public interface UserService {
    public Users selectone(String uno, String password);

    public List<Users> selectALL();

    public int insert(Users user);

    public int delete(Integer uid);

    public int update(Users user);
}
