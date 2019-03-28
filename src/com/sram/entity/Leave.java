package com.sram.entity;

public class Leave {
	private Integer id;
	private String name;
	private Integer daynumber;
	private String fromday;
	private String today;
	private String because;
	private String state;
	private String eno;
	private Integer departmentid;
	
	private Departments departments;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getDaynumber() {
		return daynumber;
	}
	public void setDaynumber(Integer daynumber) {
		this.daynumber = daynumber;
	}
	public String getFromday() {
		return fromday;
	}
	public void setFromday(String fromday) {
		this.fromday = fromday;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getBecause() {
		return because;
	}
	public void setBecause(String because) {
		this.because = because;
	}
	public Departments getDepartments() {
		return departments;
	}
	public void setDepartments(Departments departments) {
		this.departments = departments;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getDepartmentid() {
		return departmentid;
	}
	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
	}
	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}
	
}
