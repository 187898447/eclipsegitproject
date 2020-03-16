package com.py.Service.Impl;

import java.util.List;

import com.py.Mapper.BbooksMapper;
import com.py.Mapper.BookMapper;
import com.py.Service.IBookService;
import com.py.entily.Bbooks;
import com.py.entily.Book;
import com.py.entily.User;

public class BookServiceImpl implements IBookService {
	BookMapper bookMapper;
	BbooksMapper bbooksMapper;
	public void setBookMapper(BookMapper bookMapper) {
		this.bookMapper = bookMapper;
	}
	public void setBbooksMapper(BbooksMapper bbooksMapper) {
		this.bbooksMapper = bbooksMapper;
	}
	@Override
	public List<Book> qureyAllBook() {
		return bookMapper.qureyAllBook();
	}

	@Override
	public boolean addbook(Book book) {
		if(bookMapper.qureyBookWithBookName2(book)!=null) {
			book.setNumber(bookMapper.qureyBookWithBookName2(book).getNumber());
			return bookMapper.updateoutbook(book);
		}else {
			return bookMapper.addbook(book);
		}
	}
	
	@Override
	public boolean changebook(Book book) {
		return bookMapper.changebook(book);
	}

	@Override
	public boolean deletebook(Book book) {
		return bookMapper.deletebook(book);
	}

	@Override
	public List<Book> qureyBookWithBookName(Book book) {
		return bookMapper.qureyBookWithBookName(book);
	}

	@Override
	public boolean alter() {
		return bookMapper.alter();
	}

	@Override
	public boolean qureyBookWithBookName2(Book book) {
		if(bookMapper.qureyBookWithBookName2(book)!=null) {
			return true ;
		}else {
			return false;
		}
	}

	@Override
	public boolean updateoutbook(Book book) {
		return bookMapper.updateoutbook(book);
	}

	@Override
	public boolean updateoutbook2(Book book) {
		return bookMapper.updateoutbook2(book);
	}

	@Override
	public List<Book> qureyBookWithType(Book book) {
		return bookMapper.qureyBookWithType(book);
	}
	@Override
	public List<Book> qureyBbooks(List<Bbooks> bbooks) {
		return bookMapper.qureyBbooks(bbooks);
	}
}
