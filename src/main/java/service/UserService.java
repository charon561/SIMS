package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Student;
import pojo.User;

public interface UserService {
	public int register(User user);
	public List<User> queryAllUser();
	public User Login(@Param("username")String username,@Param("password")String password);
	public Student queryUserByUsername(String username);
	public int deleteUser(String username);
	public int updateUser(Student stu);
	public int updatePassword(@Param("new_password")String new_password,@Param("username")String username);

}
