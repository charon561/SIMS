package service;

import java.util.List;

import pojo.Comment;

public interface CommentService {
	public List<Comment> queryAllCommect();
	public List<Comment> queryCommentByIsbn(String isbn);
	public int insertComment(String content,String isbn,String nick);

}
