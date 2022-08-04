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
	
	@RequestMapping("revise.do")
	public String Login(Student stu, Model model,HttpSession session, HttpServletResponse response) throws IOException {
		User user=(User) session.getAttribute("user");
		stu.setSno(user.getUsername()); // 读入学生账号
		int a = userService.updateUser(stu); // a 为修改的结果，成功或者失败
		if(a == 1) {
			Student b = userService.queryUserByUsername(user.getUsername());  // 更新修改后的学生信息
			session.setAttribute("userByUsername", b);
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.print("<script>alert('修改成功！');window.location='student.jsp'</script>");
			out.flush();
		}
		else {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.print("<script>alert('修改失败！');window.location='student_modifyInformation.jsp'</script>");
			out.flush();
		}
		return "student";
	}
	
	@RequestMapping("updatePassword.do")
	public String Login(String old_password, String new_password, Model model,HttpSession session, HttpServletResponse response) throws IOException {
		User user=(User) session.getAttribute("user"); 
		String username=user.getUsername();  // 读入学生账号
		int a = userService.updatePassword(new_password, username);
		if(a == 1) {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.print("<script>alert('修改成功！');window.location='student.jsp'</script>");
			out.flush();
		}
		else {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.print("<script>alert('修改失败！');window.location='student_changePassword.jsp'</script>");
			out.flush();
		}
		return "student";
	}
}
