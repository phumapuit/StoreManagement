package com.storeManagement.service;

import com.storeManagement.model.UserModel;
import com.storeManagement.paging.Pageble;

import java.util.List;

public interface IUserService {
	UserModel findByUserNameAndPassword(String userName, String password);
	UserModel findByUsername(String userName);
	UserModel save(UserModel userModel);

	UserModel update(UserModel updateNew);

	UserModel update(UserModel updateUser, String userid);
	void delete(long[] ids);
	List<UserModel> findAll(Pageble pageble);
	int getTotalItem();

	UserModel findOne(int id);

	List<UserModel> findAll();
}
