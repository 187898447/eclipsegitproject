package com.py.Service.Impl;

import java.util.List;

import com.py.Mapper.AdminMapper;
import com.py.Service.IAdminService;
import com.py.entily.Admin;

public class AdminServiceImpl implements IAdminService {
	AdminMapper adminMapper;
	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}

	@Override
	public boolean qureyAdmin(Admin admin) {
		if(adminMapper.qureyAdmin(admin)!=null) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean addAdmin(Admin admin) {
		if(adminMapper.qureyAdminWithName(admin)!=null) {
			return false;
		}
		return adminMapper.addAdmin(admin);
	}

	@Override
	public boolean qureyAdminWithName(Admin admin) {
		if(adminMapper.qureyAdminWithName(admin)!=null) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<Admin> qureyAllAdmin() {
		return adminMapper.qureyAllAdmin();
	}

	@Override
	public boolean changeadmin(Admin admin) {
		return adminMapper.changeadmin(admin);
	}

	@Override
	public boolean deleteadmin(Admin admin) {
		return adminMapper.deleteadmin(admin);
	}

}
