package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.User;
import service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("login.do")
	public String Login(@RequestParam("username")String username,@RequestParam("password")String password,Model model,HttpSession session) {
		List<User> users = userService.queryAllUser();
		int j = 0;
		User user = new User();
		session.setAttribute("username", username);
		for (User u:users) {
			if(username.equals(u.getUsername())&&password.equals(u.getPassword())) {
				j=1;
				BeanUtils.copyProperties(u, user);
			}
		}
		session.setAttribute("permission", user.getPermission());
		if(j==0) {
			model.addAttribute("msg","账号或密码错误，请重新输入");
			return "login";
		}
		if(j==1&&user.getPermission().equals("1")) {
			return "redirect:admin/queryAllBooksToAdmin.do";
		}
		else if(j==1&&user.getPermission().equals("0")) {
			return "redirect:queryAllBooksToUser.do";
		}
		else {
			model.addAttribute("msg", "账号未存在，请先注册");
			return "register";
		}
		
	}
	@RequestMapping("admin/queryAllUsersToAdmin.do")
	public String queryAllUsersToAdmin(Model model) {
		List<User> users = userService.queryAllUser();
		model.addAttribute("users",users);
		return "usermanage";
	}
	
	@RequestMapping("register.do")
	public String register(@RequestParam("username")String username,@RequestParam("password")String password,Model model,HttpServletResponse response) throws IOException {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		int j = 0;
		List<User> users = userService.queryAllUser();
		for(User u:users) {
			if(username.equals(u.getUsername()))
			{
				j=1;
			}
		}
		if(j==1) {
			model.addAttribute("msg", "账号已存在,请重新注册");
			return "register";
		}
		int i = userService.register(user);
		if(i!=0) {
		return "login";
		}
		else {
			return "register";
		}	
	}
	@RequestMapping("admin/deleteUserByUsername.do")
	public String deleteUserByUsername(String username ,Model model) {
		int i = userService.deleteUser(username);
		if(i!=0) {
			model.addAttribute("msg","用户"+username+"删除成功");
			return "redirect:queryAllUsersToAdmin.do";
		}
		else {
			model.addAttribute("msg","用户"+username+"删除失败");
			return "redirect:updateuser.do";
		}
		
	}
	@RequestMapping("admin/queryUserByUsername.do")
	public String queryUserByUsername(String username,Model model) {
		List<User> users = userService.queryUserByUsername(username);
		for(User u:users) {
			System.out.println(u);
		}
		model.addAttribute("users", users);
		return "usermanage";
	}
	
	@RequestMapping("admin/updateUser.do")
	public String updateUser(@RequestParam("username")String username,@RequestParam("password")String password,@RequestParam("id")int id,Model model) {
		int i = userService.updateUser(username, password, id);
		if(i>=0) {
			
			model.addAttribute("msg","修改成功");
			return "redirect:queryAllUsersToAdmin.do";
		}
		else {
			model.addAttribute("msg","修改失败");
			return "redirect:queryAllUsersToAdmin.do";
		}
		
	}
	@RequestMapping("admin/updateuser.do")
	public String updateuser(int id,Model model) {
		model.addAttribute("id", id);
		return "modifyUser";
	}

}
