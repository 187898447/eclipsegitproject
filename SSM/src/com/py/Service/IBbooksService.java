package com.py.Service;

import java.util.List;

import com.py.entily.Bbooks;
import com.py.entily.User;

public interface IBbooksService {
	List<Bbooks> mybbooks(User user);
	boolean addbbooks(Bbooks bbooks);
	boolean deletebbooks(Bbooks bbooks);
}
