package com.concerto.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.concerto.ecommerce.entity.LoginCredentials;

public interface LoginCredentialsRepository extends JpaRepository<LoginCredentials, String>{

}
