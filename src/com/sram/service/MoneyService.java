package com.sram.service;

import com.sram.entity.Money;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;

public interface MoneyService {
    public PageResult getPages(PageParam p);
    public Money getmoneyByMoney(Money money);
    public int insertMoney(Money money);
    public Money getmoney(Integer mid);
    public int updatemoney(Money money);
}
