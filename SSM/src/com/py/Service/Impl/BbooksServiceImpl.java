package com.py.Service.Impl;

import java.util.List;

import com.py.Mapper.BbooksMapper;
import com.py.Mapper.BookMapper;
import com.py.Service.IBbooksService;
import com.py.entily.Bbooks;
import com.py.entily.User;

public class BbooksServiceImpl implements IBbooksService {
	BbooksMapper bbooksMapper;
	public void setBbooksMapper(BbooksMapper bbooksMapper) {
		this.bbooksMapper = bbooksMapper;
	}
	
	@Override
	public boolean addbbooks(Bbooks bbooks) {
		return bbooksMapper.addbbooks(bbooks);
	}

	@Override
	public boolean deletebbooks(Bbooks bbooks) {
		return bbooksMapper.deletebbooks(bbooks);
	}

	@Override
	public List<Bbooks> mybbooks(User user) {
		return bbooksMapper.mybbooks(user);
	}
	
}
