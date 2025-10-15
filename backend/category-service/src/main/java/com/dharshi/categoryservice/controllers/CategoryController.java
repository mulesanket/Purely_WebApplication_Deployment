package com.dharshi.categoryservice.controller;

import com.dharshi.categoryservice.dtos.ApiResponseDto;
import com.dharshi.categoryservice.dtos.CategoryRequestDto;
import com.dharshi.categoryservice.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/get/all")
    public ResponseEntity<ApiResponseDto<?>> getAllCategories() throws Exception {
        return categoryService.getAllCategories();
    }

    @GetMapping("/get/byId")
    public ResponseEntity<ApiResponseDto<?>> getCategoryById(@RequestParam String id) throws Exception {
        return categoryService.getCategoryById(id);
    }

    @PostMapping("/save")
    public ResponseEntity<ApiResponseDto<?>> saveCategory(@RequestBody CategoryRequestDto requestDto) throws Exception {
        return categoryService.createCategory(requestDto);
    }

    @PutMapping("/edit")
    public ResponseEntity<ApiResponseDto<?>> editCategory(@RequestParam String id,
                                                          @RequestBody CategoryRequestDto requestDto) throws Exception {
        return categoryService.editCategory(id, requestDto);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<ApiResponseDto<?>> deleteCategory(@RequestParam String id) throws Exception {
        return categoryService.deleteCategory(id);
    }
}
