package com.py.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.py.Service.Impl.BbooksServiceImpl;
import com.py.Service.Impl.BookServiceImpl;
import com.py.Service.Impl.UserServiceImpl;
import com.py.entily.Bbooks;
import com.py.entily.Book;
import com.py.entily.User;

@SessionAttributes(value = {"mybbooks"})
@Controller
public class BookController {
	BbooksServiceImpl bbooksService;
	BookServiceImpl bookService;
	UserServiceImpl userService;
	ModelAndView mv;
	HashMap<String, Object> map;
	
	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}
	public void setMv(ModelAndView mv) {
		this.mv = mv;
	}
	public void setBookService(BookServiceImpl bookService) {
		this.bookService = bookService;
	}
	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}
	public void setBbooksService(BbooksServiceImpl bbooksService) {
		this.bbooksService = bbooksService;
	}
	
	@RequestMapping("books")
	public ModelAndView books(ModelAndView mv,HttpServletRequest request) {
		mv.setViewName("manage");
		String name = (String)request.getSession().getAttribute("username");
		User user = new User();
		user.setName(name);
		mv.addObject("mybbooks", bbooksService.mybbooks(user));
		mv.addObject("books",bookService.qureyAllBook());
		mv.addObject("booksnumber",bookService.qureyAllBook().size());
		return mv;
	}
	
	@RequestMapping("addbook")
	public ModelAndView addbook(Book book,ModelAndView mv) {
		if(bookService.addbook(book)) {
			mv.setViewName("success");
		}else {
			mv.setViewName("failure");
		}
		return mv;
	}
	
	@RequestMapping("changebook")
	public ModelAndView changebook(Book book,ModelAndView mv) {
		if(bookService.changebook(book)) {
			mv.setViewName("success");
		}else {
			mv.setViewName("failure");
		}
		return mv;
	}
	@RequestMapping("deletebook")
	public ModelAndView deletebook(Book book,ModelAndView mv) {
		if(bookService.deletebook(book)) {
			Bbooks bbooks = new Bbooks();
			bbooks.setBookname(book.getBookname());
			bbooksService.deletebbooks(bbooks);
			bookService.alter();
			mv.setViewName("success");
		}else {
			mv.setViewName("failure");
		}
		return mv;
	}
	@RequestMapping("qureybook")
	public ModelAndView qureybook(Book book,ModelAndView mv) {
		mv.setViewName("manage");
		mv.addObject("books",bookService.qureyBookWithBookName(book));
		mv.addObject("booksnumber",bookService.qureyBookWithBookName(book).size());
		return mv;
	}
	@ResponseBody
	@RequestMapping("qureyBookWithBookName2")
	public String qureyBookWithBookName2(Book book,ModelAndView mv) {
		if(bookService.qureyBookWithBookName2(book)) {
			return "yes";
		}else {
			return "no";
		}
	}
	@RequestMapping("mybbooks")
	public ModelAndView mybboks(User user,ModelAndView mv) {
		mv.setViewName("manage");
		if(bbooksService.mybbooks(user).size()<1) {
			mv.addObject("books",null);
		}else {
			mv.addObject("books",bookService.qureyBbooks(bbooksService.mybbooks(user)));
		}
		mv.addObject("booksnumber",bbooksService.mybbooks(user).size());
		return mv;
	}
	@RequestMapping("qureyBookWithType")
	public ModelAndView qureyBookWithType(Book book,ModelAndView mv) {
		mv.setViewName("manage");
		mv.addObject("books",bookService.qureyBookWithType(book));
		mv.addObject("booksnumber",bookService.qureyBookWithType(book).size());
		return mv;
	}
}