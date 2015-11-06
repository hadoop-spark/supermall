package com.service;

import com.dao.admin.AdminDao;

public class AdminBiz {
	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	public boolean loginAdmin(String name, String password) 
	{
		return adminDao.loginAdmin(name, password);
	}
}
