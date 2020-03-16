package com.py.Mapper;

import java.util.List;

import com.py.entily.Admin;

public interface AdminMapper {
	List<Admin> qureyAllAdmin();
	Admin qureyAdmin(Admin admin);
	Admin qureyAdminWithName(Admin admin);
	boolean addAdmin(Admin admin);
	boolean changeadmin(Admin admin);
	boolean deleteadmin(Admin admin);
}
