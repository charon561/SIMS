package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pojo.Student;
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
		User a = userService.Login(user.getUsername(), user.getPassword()); // 验证账号密码是否正确
		Student b = userService.queryUserByUsername(user.getUsername());  // 查找对应的学生
		if(a == null) {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.print("<script>alert('账号密码错误！');window.location='login.jsp'</script>");
			out.flush();
		}
		InetAddress addr = InetAddress.getLocalHost();
		String ip = addr.getHostAddress().toString(); // 获取ip
		Date now = new Date(); // 获取登录时间
		session.setAttribute("time", now);
		session.setAttribute("ip", ip);
		session.setAttribute("userByUsername", b);
		session.setAttribute("user", user);
		
		return "student";
	}
	
}
