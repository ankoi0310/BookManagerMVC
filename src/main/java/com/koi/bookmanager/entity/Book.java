package com.koi.bookmanager.entity;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "book")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "title")
    @NotNull(message="This field is required.")
    private String title;

    @Column(name = "summary_content")
    @NotNull(message="This field is required.")
    private String summaryContent;

    @Column(name = "price")
    @NotNull(message="This field is required.")
    @Min(value = 1)
    private Integer price;

    @Column(name = "author")
    @NotNull(message="This field is required.")
    private String author;

    @Column(name = "publication_date")
    @NotNull(message="This field is required.")
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Temporal(TemporalType.DATE)
    private Date publicationDate;

    @Column(name = "image")
    private String image;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    @Transient
    private CommonsMultipartFile[] fileData;

    public Book() {
    }

    public Book(String title, String summaryContent, Integer price, String author, Date publicationDate, String image, Category category) {
        this.title = title;
        this.summaryContent = summaryContent;
        this.price = price;
        this.author = author;
        this.publicationDate = publicationDate;
        this.image = image;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummaryContent() {
        return summaryContent;
    }

    public void setSummaryContent(String summaryContent) {
        this.summaryContent = summaryContent;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public CommonsMultipartFile[] getFileData() {
        return fileData;
    }

    public void setFileData(CommonsMultipartFile[] fileData) {
        this.fileData = fileData;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", summaryContent='" + summaryContent + '\'' +
                ", price='" + price + '\'' +
                ", author='" + author + '\'' +
                ", publicationDate=" + publicationDate +
                ", image='" + image + '\'' +
                ", category=" + category +
                '}';
    }
}
