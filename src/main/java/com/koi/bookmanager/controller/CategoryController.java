package com.koi.bookmanager.controller;

import com.koi.bookmanager.constant.Sort;
import com.koi.bookmanager.entity.Category;
import com.koi.bookmanager.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    private GeneralService<Category> categoryService;

    @Autowired
    public CategoryController(GeneralService<Category> categoryService) {
        this.categoryService = categoryService;
    }

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/list")
    public String getList(Model model, @RequestParam(required = false) String sort) {
        List<Category> categories;
        if (sort != null) {
            int sortField = Integer.parseInt(sort);
            categories = categoryService.getList(sortField);
        } else {
            categories = categoryService.getList(Sort.Category.ID);
        }
        model.addAttribute("categories", categories);
        return "category/list";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model model) {
        Category category = new Category();
        model.addAttribute("category", category);
        return "category/form";
    }

    @PostMapping("/save")
    public String save(@Valid @ModelAttribute("category") Category category, BindingResult result) {
        if (result.hasErrors()) {
            return "category/form";
        }
        categoryService.save(category);
        return "redirect:/category/list";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("id") int id, Model model) {
        Category category = categoryService.get(id);
        model.addAttribute("category", category);
        return "category/form";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id, Model model) {
        categoryService.delete(id);
        return "redirect:/category/list";
    }

    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model model) {
        List<Category> categories = categoryService.search(keyword);
        model.addAttribute("categories", categories);
        return "category/list";
    }
}
