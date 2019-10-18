package com.example.webshop.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.webshop.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
	User findByUsername(String username);
}
