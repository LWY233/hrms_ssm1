package com.sram.dao;

import com.sram.entity.Money;
import com.sram.web.common.PageParam;

import java.util.List;

public interface MoneyDao {
	public List<Money> page(PageParam p);
	public int updatemoney (Money money);
	public int insertmoney(Money money);
	public List<Money> getmoneyByMoney(Money money);
	public Money getmoneyByid(Integer mid);
}
