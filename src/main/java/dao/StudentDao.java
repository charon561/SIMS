package dao;

import pojo.Student;

public interface StudentDao {
	public int updateStudent(Student stu);
	public Student queryStudent(String Sno);
}
