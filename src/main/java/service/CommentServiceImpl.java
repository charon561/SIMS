package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CommentDao;
import pojo.Comment;
@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	public List<Comment> queryAllCommect() {
		// TODO Auto-generated method stub
		return this.commentDao.queryAllCommect();
	}
	public List<Comment> queryCommentByIsbn(String isbn){
		return this.commentDao.queryCommentByIsbn(isbn);
	}
	public int insertComment(String content,String isbn,String nick) {
		return this.commentDao.insertComment(content, isbn, nick);
	}
}
