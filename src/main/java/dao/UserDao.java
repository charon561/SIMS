package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

//import org.apache.ibatis.annotations.Param;

import pojo.User;

public interface UserDao {
	
	public List<User> queryAllUser();
	
	public List<User> queryUserByUsername(String username);
	
	public int deleteUser(String username);
	
	public int register(User user);
	
	public User Login(@Param("username")String username,@Param("password")String password);
	
	public int updateUser(@Param("username")String username,@Param("password")String password,@Param("id") int id);

}
