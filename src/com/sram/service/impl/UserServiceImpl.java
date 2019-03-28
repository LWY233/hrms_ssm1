package com.sram.service.impl;

import com.sram.dao.UsersDao;
import com.sram.entity.Users;
import com.sram.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UsersDao usersDao;
    @Override
    public Users selectone(String uno, String password) {
        return usersDao.selectone(uno,password);
    }

    @Override
    public List<Users> selectALL() {
        return usersDao.selectALL();
    }

    @Override
    public int insert(Users user) {
        return usersDao.insert(user);
    }

    @Override
    public int delete(Integer uid) {
        return usersDao.delete(uid);
    }

    @Override
    public int update(Users user) {
        return usersDao.update(user);
    }
}
