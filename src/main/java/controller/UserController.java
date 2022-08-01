package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

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
	public String Login(User user, Model model,HttpSession session, HttpServletResponse response) throws IOException {
		if(user.getUsername() == "" || user.getUsername() == null && user.getPassword() == "" || user.getPassword() == null) {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.print("<script>alert('请输入账号密码！');window.location='login.jsp'</script>");
			out.flush();
		}
		
		session.setAttribute("username", user.getUsername());
		User a = userService.Login(user.getUsername(), user.getPassword());
		
		if(a == null) {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.print("<script>alert('账号密码错误！');window.location='login.jsp'</script>");
			out.flush();
		}
		
		return "login";
		
	}
	
}
