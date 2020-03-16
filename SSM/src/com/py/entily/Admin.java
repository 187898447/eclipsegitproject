package com.py.entily;

public class Admin {
	String name;
	Integer pwd;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPwd() {
		return pwd;
	}
	public void setPwd(Integer pwd) {
		this.pwd = pwd;
	}
	public Admin(String name, Integer pwd) {
		super();
		this.name = name;
		this.pwd = pwd;
	}
	public Admin() {
		
	}
}
