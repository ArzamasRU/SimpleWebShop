package com.example.webshop.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.webshop.domain.Product;

public interface ProductRepo extends CrudRepository<Product, Long> {
	List<Product> findByTag(String tag);
	List<Product> findByName(String name);
	Product findById(Integer id);
	List<Product> findByNameContaining(String name);
}
