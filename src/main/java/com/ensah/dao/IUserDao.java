package com.ensah.dao;

import com.ensah.bo.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IUserDao extends JpaRepository<User, Long> {
	User findByTelephone(String tele);
}
