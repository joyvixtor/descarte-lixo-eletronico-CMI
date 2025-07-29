package com.cmi.descarte.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cmi.descarte.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Métodos customizados serão implementados aqui
}
