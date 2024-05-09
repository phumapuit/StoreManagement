package com.storeManagement.service.impl;

import com.storeManagement.dao.IUserDAO;
import com.storeManagement.dao.impl.UserDAO;
import com.storeManagement.model.UserModel;
import com.storeManagement.paging.Pageble;
import com.storeManagement.service.IUserService;

import java.util.List;

public class UserService implements IUserService {

	private IUserDAO userDAO;

	public UserService() {
		userDAO = new UserDAO();
	}
	
	@Override
	public UserModel findByUserNameAndPassword(String userName, String password) {
		return userDAO.findByUserNameAndPassword(userName, password);
	}

	@Override
	public UserModel findByUsername(String userName) {
		return userDAO.findByUsername(userName);
	}

	@Override
	public UserModel save(UserModel userModel) {
		Long userId = userDAO.save(userModel);
		return userDAO.findOne(userId);
	}

	@Override
	public UserModel update(UserModel updateUser) {
		userDAO.update(updateUser);
		return userDAO.findOne(Long.valueOf(Long.valueOf(updateUser.getId())));
	}

	@Override
	public UserModel update(UserModel updateUser, String userid) {
		userDAO.update(updateUser, userid);
		return userDAO.findOne(Long.valueOf(userid));
	}

	@Override
	public void delete(long[] ids) {
		for (long id: ids) {
			userDAO.delete(id);
		}
	}

	@Override
	public List<UserModel> findAll(Pageble pageble) {
		return userDAO.findAll(pageble);
	}

	@Override
	public int getTotalItem() {
		return userDAO.getTotalItem();
	}

	@Override
	public UserModel findOne(int id) {
		return userDAO.findOne(Long.valueOf(id));
	}

	@Override
	public List<UserModel> findAll() {
		return userDAO.findAll();
	}

}
