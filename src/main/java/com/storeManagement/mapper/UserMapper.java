package com.storeManagement.mapper;

import com.storeManagement.model.RoleModel;
import com.storeManagement.model.UserModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<UserModel> {

	@Override
	public UserModel mapRow(ResultSet resultSet) {
		try {
			UserModel user = new UserModel();
			user.setId(resultSet.getInt("user_id"));
			user.setUsername(resultSet.getString("username"));
			user.setPassword(resultSet.getString("password"));
			try {
				RoleModel role = new RoleModel();
				role.setRole_id(resultSet.getInt("role_id"));
				role.setRole_name(resultSet.getString("role_name"));
				user.setRole(role);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return user;
		} catch (SQLException e) {
			return null;
		}	
	}
}
