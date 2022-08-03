package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import pojo.Student;
import pojo.User;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	public int register(User user) {
		// TODO Auto-generated method stub
		return this.userDao.register(user);
	}
	public  List<User> queryAllUser(){
		return this.userDao.queryAllUser();
	}
	
	public User Login(@Param("username")String username,@Param("password")String password) {
		return this.userDao.Login(username, password);
	}
	
	public Student queryUserByUsername(String username) {
		return this.userDao.queryUserByUsername(username);
	}
	
	public int deleteUser(String username) {
		return this.userDao.deleteUser(username);
	}
	
	public int updateUser(@Param("username")String username,@Param("password")String password,@Param("id") int id) {
		return this.userDao.updateUser(username, password, id);
		}
}
