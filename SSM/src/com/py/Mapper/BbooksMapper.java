package com.py.Mapper;

import java.util.List;

import com.py.entily.Bbooks;
import com.py.entily.User;

public interface BbooksMapper {
	List<Bbooks> mybbooks(User user);
	boolean addbbooks(Bbooks bbooks);
	boolean deletebbooks(Bbooks bbooks);
}
