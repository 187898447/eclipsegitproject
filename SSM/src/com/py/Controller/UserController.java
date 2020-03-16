package com.py.Controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.py.Mapper.BookMapper;
import com.py.Service.Impl.AdminServiceImpl;
import com.py.Service.Impl.BbooksServiceImpl;
import com.py.Service.Impl.BookServiceImpl;
import com.py.Service.Impl.UserServiceImpl;
import com.py.entily.Admin;
import com.py.entily.Bbooks;
import com.py.entily.Book;
import com.py.entily.User;

@SessionAttributes(value = {"users","admins"})
@Controller
public class UserController {
	AdminServiceImpl adminService;
	UserServiceImpl userService;
	BookServiceImpl bookService;
	BbooksServiceImpl bbooksService;
	HashMap<String,Object> hp;
	public void setHp(HashMap<String, Object> hp) {
		this.hp = hp;
	}
	public void setAdminService(AdminServiceImpl adminService) {
		this.adminService = adminService;
	}
	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}
	public void setBookService(BookServiceImpl bookService) {
		this.bookService = bookService;
	}
	public void setBbooksService(BbooksServiceImpl bbooksService) {
		this.bbooksService = bbooksService;
	}
	
	@RequestMapping("addUser")
	public String addUser(User user,@RequestParam("type") String type) {
		if(type.equals("普通用户")) {
			if(userService.addUser(user)) {
				return "success";
			}else {
				return "failure";
			}
		}else if(type.equals("管理员")) {
			Admin admin = new Admin(user.getName(),user.getPwd());
			if(adminService.addAdmin(admin)) {
				return "success";
			}else {
				return "failure";
			}
		}
		return null;
	}
	@ResponseBody
	@RequestMapping("qureyUserWhithName")
	public String qureyUserWhithName(User user,Admin admin) {
		admin.setName(user.getName());
		if(adminService.qureyAdminWithName(admin) || userService.qureyUserWhithName(user)!=null) {
			return "yes";
		}else {
			return "no";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="getpwd",produces = {"application/json;charset=UTF-8"})
	public String getpwd(User user) {
		if(userService.getpwd(user)!=null){
			return userService.getpwd(user).getProblem();
		}else {
			return "no";
		}
	}
	
	@RequestMapping("setpwd")
	public String setpwd(User user) {
		if(userService.setpwd(user)) {
			return "success";
		}else {
			return "failure";
		}
	}
	@RequestMapping("addbbooks")
	public String addbbooks(Bbooks bbooks,@RequestParam("number") Integer number,Book book) {
		book.setNumber(number);
		book.setBookname(bbooks.getBookname());
		if(number>0 && bbooksService.addbbooks(bbooks) && bookService.updateoutbook2(book) ) {
			return "success";
		}else {
			return "failure";
		}
	}
	
	@RequestMapping("rbooks")
	public String rbooks(Bbooks bbooks,@RequestParam("number") Integer number,Book book) {
		book.setBookname(bbooks.getBookname());
		book.setNumber(number);
		if(bbooksService.deletebbooks(bbooks) && bookService.updateoutbook(book)) {
			return "success";
		}else {
			return "failure";
		}
	}
	@RequestMapping("changepwd")
	public String changepwd(User user) {
		if(userService.setpwd(user)) {
			return "success";
		}else {
			return "failure";
		}
	}
	@RequestMapping("manageuser")
	public ModelAndView manageuser(ModelAndView mv) {
		mv.setViewName("manageuser");
		mv.addObject("users",userService.qureyAllUser());
		mv.addObject("admins",adminService.qureyAllAdmin());
		return mv;
	}
}
