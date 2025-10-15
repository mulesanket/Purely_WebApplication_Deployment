package com.dharshi.productservice.controller;

import com.dharshi.productservice.dtos.ApiResponseDto;
import com.dharshi.productservice.dtos.ProductRequestDto;
import com.dharshi.productservice.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/get/all")
    public ResponseEntity<ApiResponseDto<?>> getAllProducts() throws Exception {
        return productService.getAllProducts();
    }

    @GetMapping("/get/byCategory")
    public ResponseEntity<ApiResponseDto<?>> getProductsByCategory(@RequestParam String id) throws Exception {
        return productService.getProductByCategory(id);
    }

    @GetMapping("/get/byId")
    public ResponseEntity<ApiResponseDto<?>> getProductById(@RequestParam String id) throws Exception {
        return productService.getProductById(id);
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponseDto<?>> searchProducts(@RequestParam String searchKey) throws Exception {
        return productService.searchProducts(searchKey);
    }

    @PostMapping("/save")
    public ResponseEntity<ApiResponseDto<?>> saveProduct(@RequestBody ProductRequestDto requestDto) throws Exception {
        return productService.addProduct(requestDto);
    }

    @PutMapping("/edit")
    public ResponseEntity<ApiResponseDto<?>> editProduct(@RequestParam String id,
                                                         @RequestBody ProductRequestDto requestDto) throws Exception {
        return productService.editProduct(id, requestDto);
    }
}
