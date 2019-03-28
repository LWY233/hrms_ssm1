package com.sram.service.impl;

import com.sram.dao.EmployeesDao;
import com.sram.dao.MoneyDao;
import com.sram.dao.RapDao;
import com.sram.entity.Money;
import com.sram.entity.RewardAndPunish;
import com.sram.service.RapService;
import com.sram.service.TaxService;
import com.sram.web.common.PageParam;
import com.sram.web.common.PageResult;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RapServiceImpl implements RapService {
    @Autowired
    private RapDao rapDao;
    @Autowired
    private EmployeesDao employeesDao;
    @Autowired
    private MoneyDao moneyDao;
    @Autowired
    private TaxService taxService;
    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public PageResult getPages(PageParam param) {
        PageResult page_result = new PageResult();
        page_result.setPage(param.getPage());
        page_result.setPageSize(param.getPageSize());
        param.setPage((param.getPage()-1)*param.getPageSize());//将param中的page属性设置为分页查询中该页的第一个元素

        //String sql = sqlSessionFactory.getConfiguration().getMappedStatement("com.sram.dao.RapDao.page").getBoundSql(param).getSql();
        List<RewardAndPunish> rap = rapDao.page(param);
        for(RewardAndPunish m:rap){
            m.setEmployees(employeesDao.getEmployees(m.getEid()));
        }
        page_result.setData(rap);
        param.setPage(null);  //手动设置page为null,查询所有的staff记录。
        page_result.setTotal(rapDao.page(param).size());
        page_result.setTotalPage((int)Math.ceil(((double)page_result.getTotal() / page_result.getPageSize())));
        return page_result;
    }

    @Override
    public int insertrap(RewardAndPunish rap) {
        Money money = new Money();
        money.setEid(rap.getEid());
        money.setMonth(rap.getMonth());
        List<Money> list = moneyDao.getmoneyByMoney(money);
        if(list.size()==1){//判断是否有这一条薪资数据
            if(list.get(0).getState()==0){//判断是否已经发放工资  发放过就不可以添加奖罚表；
                if(rapDao.insertrap(rap)==1){//如果插入成功
                    //修改薪资表中的rapall
                    Float rapmoneyall =0F;
                    Money temp1 = list.get(0);
                    RewardAndPunish rap1 = new RewardAndPunish();
                    rap1.setEid(rap.getEid());
                    rap1.setMonth(rap.getMonth());
                    List<RewardAndPunish> raplist = rapDao.selectByRap(rap1);
                    if(raplist.size()>0){
                        for(RewardAndPunish temp: raplist){
                            if(temp.getReward()!=null){
                                rapmoneyall += temp.getReward();
                            }else{
                                rapmoneyall -= temp.getPunishment();
                            }
                        }
                        temp1.setRapall(rapmoneyall);

                        Float moneyall = temp1.getBasemoney()+temp1.getQqmoney()+temp1.getRapall()+temp1.getSubsidization()+temp1.getWorkOvertime();
                        Float pay = taxService.num(moneyall);
                        temp1.setPayment(pay);
                        temp1.setRealityMoney(moneyall-pay);
                        moneyDao.updatemoney(temp1);
                        return 1;
                    }
                }else
                    System.out.println("插入失败");
                return 0;
            }else{
                System.out.println("不可以添加，已完成交易");
                return 2;
            }
        }else{
            int i = rapDao.insertrap(rap);
            if(i>0){
                return i;
            }else
                return 0;
        }
    }

    @Override
    public RewardAndPunish getrap(int id) {
        RewardAndPunish rap = rapDao.getrapByid(id);
        rap.setEmployees(employeesDao.getEmployees(rap.getEid()));
        return rap;
    }

    @Override
    public String updaterap(RewardAndPunish rap, String beforedate) {
        if(rap.getMonth().trim().equals(beforedate.trim())){//如果没有修改月份直接修改并改变薪资表一次就可以
            if(rapDao.updaterap(rap)>0){
                int i = moneyupdate(rap);
                if(i>0){
                    return "1-修改成功";
                }else{return "0-s修改工资表失败";}

            }else{return "0-修改工资表失败！";}

        }else{//如果不想等就修改薪资表两次
            RewardAndPunish beforerap = rapDao.getrapByid(rap.getId());
            beforerap.setEmployees(employeesDao.getEmployees( rap.getEid()));
            if(rapDao.updaterap(rap)>0){
                int j = moneyupdate(beforerap);
                int i = moneyupdate(rap);
                if(i==0 || j ==0){return "0-修改工资表失败";}
                else return "1-修改工资表成功";
            }else{
                return "0-插入失败";
            }
        }
    }

    public int moneyupdate(RewardAndPunish rap){
        System.out.println(rap.getMonth());
        Money money = new Money();
        money.setEid(rap.getEid());
        money.setMonth(rap.getMonth());
        List<Money> list = moneyDao.getmoneyByMoney(money);
        System.out.println("该员工工资表有:"+list.size());
        if(list.size()>0){
            Float rapmoneyall =0F;
            Money temp1 = list.get(0);
            RewardAndPunish rap1 = new RewardAndPunish();
            rap1.setEid(rap.getEid());
            rap1.setMonth(rap.getMonth());
            List<RewardAndPunish> raplist = rapDao.selectByRap(rap1);
            if(raplist.size()>0){
                for(RewardAndPunish temp: raplist){
                    if(temp.getReward()!=null){
                        rapmoneyall += temp.getReward();
                    }else{
                        rapmoneyall -= temp.getPunishment();
                    }
                }
            }
            temp1.setRapall(rapmoneyall);

            Float moneyall = temp1.getBasemoney()+temp1.getQqmoney()+temp1.getRapall()+temp1.getSubsidization()+temp1.getWorkOvertime();
            Float pay = taxService.num(moneyall);
            temp1.setPayment(pay);
            temp1.setRealityMoney(moneyall-pay);
            if(moneyDao.updatemoney(temp1)>0)
                return 1;
            else
                return 0;
        }else{
            System.out.println("没有该表");
            return 1;
        }
    }
}
