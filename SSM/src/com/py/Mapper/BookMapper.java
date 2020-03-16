package com.py.Mapper;

import java.util.List;

import com.py.entily.Bbooks;
import com.py.entily.Book;

public interface BookMapper {
	List<Book> qureyAllBook();
	List<Book> qureyBookWithBookName(Book book);
	Book qureyBookWithBookName2(Book book);
	boolean addbook(Book book);
	boolean changebook(Book book);
	boolean deletebook(Book book);
	boolean alter();
	boolean updateoutbook(Book book);
	boolean updateoutbook2(Book book);
	List<Book> qureyBookWithType(Book book);
	List<Book> qureyBbooks(List<Bbooks> bbooks);
}
