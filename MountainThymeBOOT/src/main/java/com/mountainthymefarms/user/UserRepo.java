package com.mountainthymefarms.user;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mountainthymefarms.entities.User;

public interface UserRepo extends JpaRepository<User, Integer> {

}
