package com.py.entily;

public class User {
	String name;
	int pwd;
	String problem;
	String answer;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPwd() {
		return pwd;
	}
	public void setPwd(int pwd) {
		this.pwd = pwd;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public User(String name, int pwd, String problem, String answer) {
		super();
		this.name = name;
		this.pwd = pwd;
		this.problem = problem;
		this.answer = answer;
	}
	public User() {
	}
	
}
