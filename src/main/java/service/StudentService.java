package service;

import pojo.Student;

public interface StudentService {
	public int updateStudent(Student stu);
	public Student queryStudent(String Sno);
}
