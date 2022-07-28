package pojo;

import java.util.Date;

public class Book {
	private String isbn;
	private String title;
	private String author;
	private String introduction;
	private double price;
	private String publisher;
	private String photo;
	private Date publishcationDate;
	private Type type;
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getPublishcationDate() {
		return publishcationDate;
	}
	public void setPublishcationDate(Date publishcationDate) {
		this.publishcationDate = publishcationDate;
	}
	@Override
	public String toString() {
		return "Book [isbn=" + isbn + ", title=" + title + ", author=" + author + ", introduction=" + introduction
				+ ", price=" + price + ", publisher=" + publisher + ", photo=" + photo + ", publishcationDate="
				+ publishcationDate + ", type=" + type + "]";
	}
	
	
}
