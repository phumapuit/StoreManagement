package com.storeManagement.dao.impl;

import com.storeManagement.dao.IUserDAO;
import com.storeManagement.mapper.UserMapper;
import com.storeManagement.model.UserModel;
import com.storeManagement.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.util.List;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

	@Override
	public UserModel findByUserNameAndPassword(String userName, String password) {
		StringBuilder sql = new StringBuilder("SELECT * FROM users AS u");
		sql.append(" INNER JOIN roles AS r ON r.role_id = u.role_id");
		sql.append(" WHERE username = ? AND password = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName, password);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public UserModel findByUsername(String userName) {
		StringBuilder sql = new StringBuilder("SELECT * FROM users");
		sql.append(" WHERE username = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public Long save(UserModel userModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO users (username, password, role_id)");
		sql.append(" VALUES(?, ?, ?)");
		return insert(sql.toString(), userModel.getUsername(), userModel.getPassword(),2);
	}

	@Override
	public void update(UserModel updateUser) {
		StringBuilder sql = new StringBuilder("UPDATE users SET password = ? WHERE user_id = ?");
		update(sql.toString(), updateUser.getPassword(), updateUser.getId());
	}

	@Override
	public void update(UserModel updateUser, String userId) {
		StringBuilder sql = new StringBuilder("UPDATE users SET password = ? WHERE user_id = ?");
		update(sql.toString(), updateUser.getPassword(), userId);
	}

	@Override
	public UserModel findOne(Long id) {
		StringBuilder sql = new StringBuilder("SELECT * FROM users join roles on users.role_id = roles.role_id where user_id = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), id);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) FROM users";
		return count(sql);
	}

	@Override
	public List<UserModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM users join roles where users.role_id = roles.role_id");
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		}
		return query(sql.toString(), new UserMapper());
	}

	@Override
	public void delete(long id) {
		String sql = "DELETE FROM users WHERE user_id = ?";
		update(sql, id);
	}

	@Override
	public List<UserModel> findAll() {
		String sql = "SELECT * FROM users join roles where users.role_id = roles.role_id";
		return query(sql, new UserMapper());
	}

}
