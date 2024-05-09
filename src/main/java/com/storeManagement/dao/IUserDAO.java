package com.storeManagement.dao;

import com.storeManagement.model.UserModel;
import com.storeManagement.paging.Pageble;

import java.util.List;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findByUserNameAndPassword(String userName, String password);
	UserModel findByUsername(String userName);
	Long save(UserModel userModel);

	void update(UserModel updateNew);

	void update(UserModel updateNew, String userId);

	UserModel findOne(Long id);

	int getTotalItem();

	List<UserModel> findAll(Pageble pageble);

	void delete(long id);

	List<UserModel> findAll();
}
