package com.py.entily;

public class Bbooks {
	String name;
	String bookname;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public Bbooks(String name, String bookname) {
		super();
		this.name = name;
		this.bookname = bookname;
	}
	public Bbooks() {
	}
}
