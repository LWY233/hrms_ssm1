package com.sram.entity;

public class RewardAndPunish {
	private Integer id;
	private Float reward;
	private Float punishment;
	private String because;
	private String month;
	private Integer eid;
	private Employees employees;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Float getReward() {
		return reward;
	}
	public void setReward(Float reward) {
		this.reward = reward;
	}
	public Float getPunishment() {
		return punishment;
	}
	public void setPunishment(Float punishment) {
		this.punishment = punishment;
	}
	public String getBecause() {
		return because;
	}
	public void setBecause(String because) {
		this.because = because;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Employees getEmployees() {
		return employees;
	}
	public void setEmployees(Employees employees) {
		this.employees = employees;
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	
}
