package com.sram.entity;

public class Checkin {
	private Integer id;
	private String checkdate;
	private Integer qqdays; //全勤
	private Integer qjdays;//请假
	private Integer kgdays;//旷工
	public Integer getKgdays() {
		return kgdays;
	}
	public void setKgdays(Integer kgdays) {
		this.kgdays = kgdays;
	}
	private Integer fdxjdays;//法定休假
	private Integer cdminutes;//迟到分钟数
	private Integer ztminutes;//早退分钟数
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCheckdate() {
		return checkdate;
	}
	public void setCheckdate(String checkdate) {
		this.checkdate = checkdate;
	}
	public Integer getQqdays() {
		return qqdays;
	}
	public void setQqdays(Integer qqdays) {
		this.qqdays = qqdays;
	}
	public Integer getQjdays() {
		return qjdays;
	}
	public void setQjdays(Integer qjdays) {
		this.qjdays = qjdays;
	}
	public Integer getFdxjdays() {
		return fdxjdays;
	}
	public void setFdxjdays(Integer fdxjdays) {
		this.fdxjdays = fdxjdays;
	}
	public Integer getCdminutes() {
		return cdminutes;
	}
	public void setCdminutes(Integer cdminutes) {
		this.cdminutes = cdminutes;
	}
	public Integer getZtminutes() {
		return ztminutes;
	}
	public void setZtminutes(Integer ztminutes) {
		this.ztminutes = ztminutes;
	}
	
}
