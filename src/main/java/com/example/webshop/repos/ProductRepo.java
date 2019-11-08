package com.example.webshop.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.webshop.domain.Product;

public interface ProductRepo extends CrudRepository<Product, Long> {
	List<Product> findByType(String type);
	Product findById(Integer id);
	Product findByModel(String model);
	List<Product> findByModelContaining(String model);
}
