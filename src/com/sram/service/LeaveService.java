package com.sram.service;

import com.sram.entity.Leave;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;

import java.util.List;

public interface LeaveService {
    public int insert(Leave leave);

    public int update(Leave leave);

    public int delete(int id);

    public Leave selectOne(int id);

    public List<Leave> selectAll();

    public Leave select(Leave leave);

    public PageResult getPages(PageParam param);
}
