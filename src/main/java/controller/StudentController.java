package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pojo.Student;
import pojo.User;
import service.StudentService;
import service.UserService;


@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	@RequestMapping("updateStudent.do")
	public String Login(Student stu, Model model,HttpSession session, HttpServletResponse response) throws IOException {
		User user=(User) session.getAttribute("user");//
		stu.setSno(user.getUsername()); // ����ѧ���˺�
		int a = studentService.updateStudent(stu); // a Ϊ�޸ĵĽ�����ɹ�����ʧ��
		if(a == 1) {
			Student b = studentService.queryStudent(stu.getSno());  //
			session.setAttribute("queryStudent", b);  // �����޸ĺ��ѧ����Ϣ
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.print("<script>alert('�޸ĳɹ���');window.location='student.jsp'</script>");
			out.flush();
		}
		else {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.print("<script>alert('�޸�ʧ�ܣ�');window.location='student_modifyInformation.jsp'</script>");
			out.flush();
		}
		return "student";
	}
}
