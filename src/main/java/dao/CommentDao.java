package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Comment;

public interface CommentDao {
	public List<Comment> queryAllCommect();
	public List<Comment> queryCommentByIsbn(String isbn);
	public int insertComment(@Param("content")String content,@Param("isbn")String isbn,@Param("nick")String nick);

}
