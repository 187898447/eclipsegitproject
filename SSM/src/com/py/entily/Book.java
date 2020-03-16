package com.py.entily;

import java.math.BigDecimal;

public class Book {
	Integer id;
	String bookname;
	String author;
	String type;
	BigDecimal price;
	Integer number;
	public int getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	
	public Book(Integer id, String bookname, String author, String type, BigDecimal price, Integer number) {
		super();
		this.id = id;
		this.bookname = bookname;
		this.author = author;
		this.type = type;
		this.price = price;
		this.number = number;
	}
	public Book() {
	}
}
