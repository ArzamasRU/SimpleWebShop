package com.example.webshop.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.webshop.domain.Basket;
import com.example.webshop.domain.Product;
import com.example.webshop.domain.User;

public interface BasketRepo extends CrudRepository<Basket, Long> {
	List<Basket> findByUser(User user);
	Basket findByUserAndProduct(User user, Product product);
}
