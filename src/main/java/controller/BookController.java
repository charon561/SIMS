package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.Book;
import pojo.Comment;
import service.BookService;
import service.CommentService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	@RequestMapping("queryAllBooksToUser.do")
	public String queryAllBooksToUser(Model model) {
		List<Book> books = bookService.queryAllBooks();
		model.addAttribute("books", books);
		return "books_read";
	}
	@RequestMapping("admin/queryAllBooksToAdmin.do")
	public String queryAllBooksToAdmin(Model model) {
		List<Book> books = bookService.queryAllBooks();
		/*
		if(books!=null)
		{
			for(Book b:books) {
				System.out.println(b.toString());
			}
		}
		*/
		model.addAttribute("books", books);
		return "admin_book";
	}
	@RequestMapping("queryBookByTitleAndTypename.do")
	public String queryBookByTitleOrAuthor(@RequestParam("title")String title,@RequestParam("typename")String typename,Model model) {
		List<Book> books = bookService.queryBookByTitleAndTypename(title, typename);
		model.addAttribute("books", books);
		return "book_read";
	}
	@RequestMapping("queryBookByTitle.do")
	public String queryBookByTitle(String isbn,Model model) {
		List<Book> books = bookService.queryBookByTitle(isbn);
		model.addAttribute("books", books);
		return "book_read";
		
	}
	@RequestMapping("admin/deleteByIsbn.do")
	public String deleteByIsbn(String isbn ,Model model,HttpServletRequest request) {
		int i = bookService.deleteByIsbn(isbn);
		return "redirect:queryAllBooksToAdmin.do";
	}
	@RequestMapping("admin/addBook.do")
	public String addBook(Model model,@RequestParam("isbn")String isbn,@RequestParam("title")String title,@RequestParam("type_id")String type_id,@RequestParam("author")String author,@RequestParam("introduction")String introduction,@RequestParam("price")String price,@RequestParam("publisher")String publisher,@RequestParam("photo")String photo,@RequestParam("publishcationDate")String publishcationDate) throws ParseException{
		List<Book> books = bookService.queryAllBooks();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(publishcationDate);
		double Price=Double.parseDouble(price);
		int j=0;
		String str = photo;
		String new_photo = photo.substring(photo.lastIndexOf('\\')+1);
		System.out.println(new_photo);
		for(Book b:books) {
			if(isbn.equals(b.getIsbn())) {
				j=1;
			}
		}
		if(j==1) {
			model.addAttribute("msg","该Isbn号重复，请重新填写");
			return "addBook";
		}
		if(bookService.addBook(isbn, title, type_id, author, introduction, Price, publisher, new_photo, date)!=0) {
			model.addAttribute("msg", "插入成功");
			return "redirect:queryAllBooksToAdmin.do";
		}
		return "redirect:queryAllBooksToAdmin.do";
		
	}
	@RequestMapping("admin/updateBook.do")
	public String updateBook(Model model,@RequestParam("isbn")String isbn,@RequestParam("title")String title,@RequestParam("type_id")String type_id,@RequestParam("author")String author,@RequestParam("introduction")String introduction,@RequestParam("price")String price,@RequestParam("publisher")String publisher,@RequestParam("photo")String photo,@RequestParam("publishcationDate")String publishcationDate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(publishcationDate);

		double Price=Double.parseDouble(price);
		
		String str = photo;
		String new_photo = photo.substring(photo.lastIndexOf('\\')+1);
		if(bookService.updateBook(isbn, title, type_id, author, introduction, Price, publisher, new_photo, date)!=0) {
			return "redirect:queryAllBooksToAdmin.do";
		}
		else {
			model.addAttribute("msg","修改失败,请重新输入");
			return "modify";
		}
		
	}
	@RequestMapping("admin/updatebook.do")
	public String update(@RequestParam("isbn")String isbn ,Model model) {
		model.addAttribute("isbn", isbn);
		return "modify";
		
	}
	
}
