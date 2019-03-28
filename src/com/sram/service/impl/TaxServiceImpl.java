package com.sram.service.impl;

import com.sram.dao.TaxDao;
import com.sram.entity.Tax;
import com.sram.service.TaxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaxServiceImpl implements TaxService {
    @Autowired
    private TaxDao taxDao;

    @Override
    public Float num(Float money) {
        List<Tax> list = taxDao.selectAll();
        if(money > 4000 && money <= 80000){
            money = money - 4000;
            for (Tax t : list){
                if(t.getFrommoney() == null){
                    t.setFrommoney(0);
                }
                if(money > t.getFrommoney() && money <= t.getTopmoney()){
                    money = (money * t.getRate()) -t.getReduce();
                    break;
                }
            }
            return money;
        }else if(money > 80000){
            money = money - 4000;
            System.out.println(list.get(6).getRate());
            money = (money*list.get(6).getRate())-list.get(6).getReduce();
            return money;
        }else{
            return 0F;
        }
    }
}
