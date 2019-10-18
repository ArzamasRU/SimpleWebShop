package com.example.webshop.controller;

import java.util.ArrayList;
import java.util.List;

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
@RequestMapping("/basket")
public class BasketController {
	@Autowired
	private ProductRepo productRepo;

	@Autowired
	private BasketRepo basketRepo;

	@GetMapping()
	public String basket(@AuthenticationPrincipal User user, Model model) {
		List<Product> products = new ArrayList<>();
		Iterable<Basket> basketRows = basketRepo.findByUser(user);
		for (Basket basket : basketRows) {
			products.add(basket.getProduct());
		}
		model.addAttribute("products", products);
		return "basket";
	}

	@PostMapping(params = "sendProduct")
	public String SendProduct(@AuthenticationPrincipal User user, @RequestParam Integer id,
			Model model) {
		basketRepo.delete(getBasketByUserAndProductId(user, id));
		basket(user, model);
		model.addAttribute("message", "Product has sent");
		return "basket";
	}

	@PostMapping(params = "deleteProduct")
	public String deleteProduct(@AuthenticationPrincipal User user, @RequestParam Integer id,
			Model model) {
		basketRepo.delete(getBasketByUserAndProductId(user, id));
		basket(user, model);
		model.addAttribute("message", "Product has been removed from the basket");
		return "basket";
	}

	public Basket getBasketByUserAndProductId(User user, Integer id) {
		Product product = productRepo.findById(id);
		Basket basket = basketRepo.findByUserAndProduct(user, product);
		return basket;
	}
}
