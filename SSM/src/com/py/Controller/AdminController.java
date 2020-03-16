package com.py.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.py.Service.Impl.AdminServiceImpl;
import com.py.Service.Impl.BbooksServiceImpl;
import com.py.Service.Impl.UserServiceImpl;
import com.py.entily.Admin;
import com.py.entily.Book;
import com.py.entily.User;

@SessionAttributes(value = {"adminname","username"})
@Controller
public class AdminController {
	AdminServiceImpl adminService;
	UserServiceImpl userService;
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
	public void setBbooksService(BbooksServiceImpl bbooksService) {
		this.bbooksService = bbooksService;
	}
	
	@RequestMapping("index")
	public String qureyAdmin(User user,Admin admin,Map<String,Object> map,@RequestParam("save") String save,HttpServletResponse response) {
		if(!save.equals("0")) {
			Cookie cookie = new Cookie("user", user.getName()+"-"+user.getPwd());
			cookie.setPath("/");
			cookie.setMaxAge(60);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("user", null);
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		if(adminService.qureyAdmin(admin)) {
			map.put("adminname", admin.getName());
			return "success";
		}else if(userService.qureyUser(user)!=null) {
			map.put("username", user.getName());
			return "success";
		}else {
			return "failure";
		}
	}
	@RequestMapping("changeuser")
	public String changeuser(User user,@RequestParam("type") String type) {
		if(type.equals("普通用户")) {
			if(userService.changeuser(user)) {
				return "success";
			}else {
				return "failure";
			}
		}else if(type.equals("管理员")) {
			Admin admin = new Admin(user.getName(),user.getPwd());
			if(adminService.changeadmin(admin)) {
				return "success";
			}else {
				return "failure";
			}
		}
		return null;
	}
	@RequestMapping("deleteuser")
	public String deleteuser(User user,@RequestParam("type") String type) {
		if(type.equals("普通用户")) {
			if(userService.deleteuser(user)) {
				return "success";
			}else {
				return "failure";
			}
		}else if(type.equals("管理员")) {
			Admin admin = new Admin(user.getName(),user.getPwd());
			if(adminService.deleteadmin(admin)) {
				return "success";
			}else {
				return "failure";
			}
		}
		return null;
	}
}
