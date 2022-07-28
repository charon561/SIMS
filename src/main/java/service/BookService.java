package service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Book;

public interface BookService {
	public List<Book> queryAllBooks();
	public List<Book> queryBookByTitleAndTypename(@Param("title")String title,@Param("typename")String typename);
	public List<Book> queryBookByTitle(String isbn);
	public int deleteByIsbn(String isbn);
	public int addBook(@Param("isbn")String isbn,@Param("title")String title,@Param("type_id")String type_id,@Param("author")String author,@Param("introduction")String introduction,@Param("price")double price,@Param("publisher")String publisher,@Param("photo")String photo,@Param("publishcationDate")Date publishcationDate);
	public int updateBook(@Param("isbn")String isbn,@Param("title")String title,@Param("type_id")String type_id,@Param("author")String author,@Param("introduction")String introduction,@Param("price")double price,@Param("publisher")String publisher,@Param("photo")String photo,@Param("publishcationDate")Date publishcationDate);

}
