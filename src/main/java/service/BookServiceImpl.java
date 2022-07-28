package service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BookDao;
import pojo.Book;
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;
	public List<Book> queryAllBooks() {
		// TODO Auto-generated method stub
		return this.bookDao.queryAllBooks();
	}
	public List<Book> queryBookByTitleAndTypename(@Param("title")String title,@Param("typename")String typename) {
		// TODO Auto-generated method stub
		return this.bookDao.queryBookByTitleAndTypename(title, typename);
	}
	public List<Book> queryBookByTitle(String isbn) {
		return this.bookDao.queryBookByTitle(isbn);
	}
	public int deleteByIsbn(String isbn) {
		return this.bookDao.deleteByIsbn(isbn);
	}
	public int addBook(@Param("isbn")String isbn,@Param("title")String title,@Param("type_id")String type_id,@Param("author")String author,@Param("introduction")String introduction,@Param("price")double price,@Param("publisher")String publisher,@Param("photo")String photo,@Param("publishcationDate")Date publishcationDate) {
		return this.bookDao.addBook(isbn, title, type_id, author, introduction, price, publisher, photo, publishcationDate);
	}
	public int updateBook(@Param("isbn")String isbn,@Param("title")String title,@Param("type_id")String type_id,@Param("author")String author,@Param("introduction")String introduction,@Param("price")double price,@Param("publisher")String publisher,@Param("photo")String photo,@Param("publishcationDate")Date publishcationDate) {
		return this.bookDao.updateBook(isbn, title, type_id, author, introduction, price, publisher, photo, publishcationDate);
	}

}
