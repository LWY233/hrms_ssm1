package com.sram.service.impl;

import com.sram.dao.EmployeesDao;
import com.sram.dao.MoneyDao;
import com.sram.entity.Money;
import com.sram.service.MoneyService;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MoneyServiceImpl implements MoneyService {
    @Autowired
    private MoneyDao moneyDao;
    @Autowired
    private EmployeesDao employeesDao;
    @Override
    public PageResult getPages(PageParam p) {
        PageResult pageResult = new PageResult();
        pageResult.setPage(p.getPage());
        pageResult.setPageSize(p.getPageSize());
        p.setPage((p.getPage() - 1) * p.getPageSize());//将param中的page属性设置为分页查询中该页的第一个元素
        List<Money> monies = moneyDao.page(p);
        for(Money m : monies){
            m.setEmployees(employeesDao.getEmployees(m.getEid()));
        }
        pageResult.setData(monies);
        p.setPage(null);//手动设置page为null,查询所有的staff记录。
        pageResult.setTotal(moneyDao.page(p).size());
        pageResult.setTotalPage((int)Math.ceil(((double)pageResult.getTotal() / pageResult.getPageSize())));
        return pageResult;
    }

    @Override
    public Money getmoneyByMoney(Money money) {
        List<Money> list = moneyDao.getmoneyByMoney(money);
        if(list.size() == 0){
            return  null;
        }
        return list.get(0);
    }

    @Override
    public int insertMoney(Money money) {
        return moneyDao.insertmoney(money);
    }

    @Override
    public Money getmoney(Integer mid) {
        Money money = moneyDao.getmoneyByid(mid);
        money.setEmployees(employeesDao.getEmployees(money.getEid()));
        return money;
    }

    @Override
    public int updatemoney(Money money) {
        return moneyDao.updatemoney(money);
    }
}
