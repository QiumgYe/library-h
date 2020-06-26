package com.library.service;

public class AdminLoginServiceImpl implements AdminLoginService {

	@Override
	public int validLogin(String adminid, String adminpw) {
		// TODO Auto-generated method stub
		if ("admin".equals(adminid)
				&& "12345".equals(adminpw))
			{
				return 99;
			}
			return -1;
	}

}
