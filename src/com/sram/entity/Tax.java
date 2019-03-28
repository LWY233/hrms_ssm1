package com.sram.entity;

public class Tax {
	private Integer tid;
	private Integer frommoney;
	private Integer topmoney;
	private Float rate;
	private Integer reduce;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Integer getFrommoney() {
		return frommoney;
	}
	public void setFrommoney(Integer frommoney) {
		this.frommoney = frommoney;
	}
	public Integer getTopmoney() {
		return topmoney;
	}
	public void setTopmoney(Integer topmoney) {
		this.topmoney = topmoney;
	}
	public Float getRate() {
		return rate;
	}
	public void setRate(Float rate) {
		this.rate = rate;
	}
	public Integer getReduce() {
		return reduce;
	}
	public void setReduce(Integer reduce) {
		this.reduce = reduce;
	}
	
}
