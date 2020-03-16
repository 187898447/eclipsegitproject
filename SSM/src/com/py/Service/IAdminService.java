package com.py.Service;

import java.util.List;

import com.py.entily.Admin;

public interface IAdminService {
	List<Admin> qureyAllAdmin();
	boolean qureyAdmin(Admin admin);
	boolean qureyAdminWithName(Admin admin);
	boolean addAdmin(Admin admin);
	boolean changeadmin(Admin admin);
	boolean deleteadmin(Admin admin);
}
