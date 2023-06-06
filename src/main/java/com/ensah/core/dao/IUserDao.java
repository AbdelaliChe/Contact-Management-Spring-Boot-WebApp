package com.ensah.core.dao;

import com.ensah.core.bo.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IUserDao extends JpaRepository<User, Long> {
	User findByTelephone(String tele);
}
