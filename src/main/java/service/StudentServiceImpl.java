package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.StudentDao;
import pojo.Student;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao studentDao;
	public int updateStudent(Student stu) {
		return this.studentDao.updateStudent(stu);
	}
	@Override
	public Student queryStudent(String Sno) {
		return this.studentDao.queryStudent(Sno);
	}
}
