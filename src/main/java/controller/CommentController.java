package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.Comment;
import service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	
	public String queryAllComment(Model model) {
		List<Comment> comment = commentService.queryAllCommect();
		model.addAttribute("comment", comment);
		return null;
		
	}
	@RequestMapping("queryCommentByIsbn.do")
	public String queryCommentByIsbn(String isbn,Model model) {
		List<Comment> comments = commentService.queryCommentByIsbn(isbn);
		model.addAttribute("comments", comments);
		model.addAttribute("isbn", isbn);
		return "comment";
	}
	@RequestMapping("insertComment.do")
	public String insertComment(@RequestParam("content")String content,@RequestParam("isbn")String isbn,Model model,HttpSession session) {
		String nick = (String) session.getAttribute("username");
		int i = commentService.insertComment(content, isbn, nick);
		if(i>=0) {
			model.addAttribute("isbn", isbn);
			return "redirect:queryCommentByIsbn.do";
		}
		else {
			model.addAttribute("msg","评论失败");
			model.addAttribute("isbn", isbn);
			return "redirect:queryCommentByIsbn.do";
		}
	}
}
