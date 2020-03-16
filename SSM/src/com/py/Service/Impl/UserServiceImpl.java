package com.py.Service.Impl;

import java.util.List;

import com.py.Mapper.UserMapper;
import com.py.Service.IUserService;
import com.py.entily.User;

public class UserServiceImpl implements IUserService {
	UserMapper userMapper;
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public User qureyUser(User user) {
		return userMapper.qureyUser(user);
	}

	@Override
	public boolean addUser(User user) {
		if (userMapper.qureyUser(user)!=null) {
			return false;
		}
		return userMapper.addUser(user);
	}

	@Override
	public User qureyUserWhithName(User user) {
		return userMapper.qureyUserWhithName(user);
	}

	@Override
	public User getpwd(User user) {
		return userMapper.qureyUserWhithName(user);
	}

	@Override
	public boolean setpwd(User user) {
		return userMapper.setpwd(user);
	}

	@Override
	public List<User> qureyAllUser() {
		return userMapper.qureyAllUser();
	}

	@Override
	public boolean changeuser(User user) {
		return userMapper.changeuser(user);
	}

	@Override
	public boolean deleteuser(User user) {
		return userMapper.deleteuser(user);
	}

}
