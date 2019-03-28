package com.sram.service;

import com.sram.entity.RewardAndPunish;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;

public interface RapService {
    public PageResult getPages(PageParam p);
    public int insertrap(RewardAndPunish rap);
    public RewardAndPunish getrap(int id);
    public String updaterap(RewardAndPunish rap,String beforedate);
}
