package com.koi.bookmanager.controller;

import com.koi.bookmanager.constant.Sort;
import com.koi.bookmanager.entity.Book;
import com.koi.bookmanager.entity.Category;
import com.koi.bookmanager.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.validation.Valid;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    private GeneralService<Book> bookService;
    private GeneralService<Category> categoryService;
    private ServletContext servletContext;

    @Autowired
    public BookController(GeneralService<Book> bookService, GeneralService<Category> categoryService, ServletContext servletContext) {
        this.bookService = bookService;
        this.categoryService = categoryService;
        this.servletContext = servletContext;
    }

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/list")
    public String getList(Model model, @RequestParam(required = false) String sort) {
        List<Book> books;
        if (sort != null) {
            int sortField = Integer.parseInt(sort);
            books = bookService.getList(sortField);
        } else {
            books = bookService.getList(Sort.Book.ID);
        }
        model.addAttribute("books", books);
        return "book/list";
    }

    @PostMapping("/save")
    public String save(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model) {
        if (result.hasErrors()) {
            if (book.getId() != 0) {
                book = bookService.get(book.getId());
                model.addAttribute("oldImage", book.getImage());
            }
            List<Category> categories = categoryService.getList(Sort.Category.ID);
            model.addAttribute("categories", categories);
            return "book/form";
        }
        upload(book);
        bookService.save(book);
        return "redirect:/book/list";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model model) {
        Book book = new Book();
        model.addAttribute("book", book);
        model.addAttribute("oldImage", null);

        List<Category> categories = categoryService.getList(Sort.Category.ID);
        model.addAttribute("categories", categories);
        return "book/form";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("id") int id, Model model) {
        Book book = bookService.get(id);
        model.addAttribute("book", book);
        model.addAttribute("oldImage", book.getImage());
        List<Category> categories = categoryService.getList(Sort.Category.ID);
        model.addAttribute("categories", categories);
        return "book/form";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id) {
        bookService.delete(id);
        return "redirect:/book/list";
    }

    @GetMapping("/search")
    public String search(@RequestParam(required = false) String keyword, Model model) {
        List<Book> books = bookService.search(keyword);
        model.addAttribute("books", books);
        return "book/list";
    }

    private void upload(@ModelAttribute("book") Book book) {
        CommonsMultipartFile[] files = book.getFileData();
        if (files != null) {
            for (CommonsMultipartFile file : files) {
                String filename = System.currentTimeMillis() + "-" + file.getOriginalFilename();
                String path = servletContext.getRealPath("/") + "resources\\images\\books\\" + filename;
                if (book.getImage() != null || !book.getImage().equals("")) {
                    File oldFile = new File(servletContext.getRealPath("/") + "resources\\images\\books\\" + book.getImage());
                    if (oldFile.delete()) {
                        System.out.println("Deleted old file: " + book.getImage());
                    } else {
                        System.out.println("Can not delete file: " + book.getImage());
                    }
                }
                book.setImage(filename);
                try {
                    file.transferTo(new File(path));
                    System.out.println("File saved: " + filename);
                } catch (Exception e) {
                    System.out.println("Error save file: " + filename);
                }
            }
        }
    }
}
