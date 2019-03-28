package com.sram.entity;

import java.util.ArrayList;
import java.util.List;

public class Employees {
	private Integer eid;
	private String eno;
	private String ename;
	private String esex;
	private String nationality;
	private String brity;
	private String politicalParty;
	private String cultureLevel;
	private String familyPlace;
	private String idCard;
	private String mobile;
	private String hiredate;
	private String title;
	private String upperno;
	private Integer did;
	private Integer uid;
	private Integer cid;
	
	private Users user;
	private Contract contract;
	private Departments departments;
	private List<Money> money = new ArrayList<Money>();
	private List<Leave> leave = new ArrayList<Leave>();
	private List<RewardAndPunish> rap = new ArrayList<RewardAndPunish>();
	private List<Checkin> checkin = new ArrayList<Checkin>();
	
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEsex() {
		return esex;
	}
	public void setEsex(String esex) {
		this.esex = esex;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getBrity() {
		return brity;
	}
	public void setBrity(String brity) {
		this.brity = brity;
	}

	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUpperno() {
		return upperno;
	}
	public void setUpperno(String upperno) {
		this.upperno = upperno;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public Contract getContract() {
		return contract;
	}
	public void setContract(Contract contract) {
		this.contract = contract;
	}
	public List<Money> getMoney() {
		return money;
	}
	public void setMoney(List<Money> money) {
		this.money = money;
	}
	public List<Leave> getLeave() {
		return leave;
	}
	public void setLeave(List<Leave> leave) {
		this.leave = leave;
	}
	public List<RewardAndPunish> getRap() {
		return rap;
	}
	public void setRap(List<RewardAndPunish> rap) {
		this.rap = rap;
	}
	public List<Checkin> getCheckin() {
		return checkin;
	}
	public void setCheckin(List<Checkin> checkin) {
		this.checkin = checkin;
	}
	public Departments getDepartments() {
		return departments;
	}
	public void setDepartments(Departments departments) {
		this.departments = departments;
	}
	public String getPoliticalParty() {
		return politicalParty;
	}
	public void setPoliticalParty(String politicalParty) {
		this.politicalParty = politicalParty;
	}
	public String getCultureLevel() {
		return cultureLevel;
	}
	public void setCultureLevel(String cultureLevel) {
		this.cultureLevel = cultureLevel;
	}
	public String getFamilyPlace() {
		return familyPlace;
	}
	public void setFamilyPlace(String familyPlace) {
		this.familyPlace = familyPlace;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	
	
}
