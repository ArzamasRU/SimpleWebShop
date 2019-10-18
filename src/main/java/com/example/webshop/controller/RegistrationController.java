package com.example.webshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.webshop.domain.User;
import com.example.webshop.repos.UserRepo;

@Controller
public class RegistrationController {
	@Autowired
	private UserRepo userRepo;

	@GetMapping("/registration")
	public String registration() {
		return "registration";
	}

	@PostMapping("/registration")
	public String addUser(User user, Model model) {
		User userFromDb = userRepo.findByUsername(user.getUsername());
		if (userFromDb != null) {
			model.addAttribute("message", "User exists!");
			return "registration";
		}
		userRepo.save(user);
		return "redirect:/login";
	}
}
