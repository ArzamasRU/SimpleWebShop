package com.example.webshop.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.webshop.domain.Basket;
import com.example.webshop.domain.Product;
import com.example.webshop.domain.User;
import com.example.webshop.repos.BasketRepo;
import com.example.webshop.repos.ProductRepo;

@Controller
@RequestMapping("/products")
public class ProductController {
	@Autowired
	private ProductRepo productRepo;

	@Autowired
	private BasketRepo basketRepo;

	@GetMapping()
	public String sort(@RequestParam(required = false, defaultValue = "") String typeOfSort,
			@RequestParam(required = false, defaultValue = "") String filter, Model model) {

		Iterable<Product> products = productRepo.findAll();
		if (filter != null && !filter.isEmpty()) {
			if (typeOfSort.equals("tag")) {
				products = productRepo.findByTag(filter);
				model.addAttribute("filterByTag", filter);
			} else if (typeOfSort.equals("name")) {
				products = productRepo.findByNameContaining(filter);
				model.addAttribute("filterByName", filter);
			}
		} else {
			products = productRepo.findAll();
		}
		model.addAttribute("products", products);
		return "products";
	}

	@PostMapping()
	public String addToBasket(@AuthenticationPrincipal User user, @RequestParam Integer id,
			Model model) throws IOException {

		if (user != null) {
			Product product = productRepo.findById(id);
			Basket basket = basketRepo.findByUserAndProduct(user, product);
			if (basket == null) {
				basketRepo.save(new Basket(user, product));
				model.addAttribute("message", "Product added to basket");
			} else
				model.addAttribute("message", "Product is already in the basket");
		} else
			model.addAttribute("message", "Please, sign in");

		Iterable<Product> products = productRepo.findAll();
		model.addAttribute("products", products);
		return "products";
	}
}
