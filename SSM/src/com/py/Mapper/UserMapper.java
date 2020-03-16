package com.py.Mapper;

import java.util.List;

import com.py.entily.User;

public interface UserMapper {
	List<User> qureyAllUser();
	User qureyUser(User user);
	User qureyUserWhithName(User user);
	boolean addUser(User user);
	boolean setpwd(User user);
	boolean changeuser(User user);
	boolean deleteuser(User user);
}
