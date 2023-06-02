package com.ensah.service;

import com.ensah.bo.User;
import com.ensah.dao.IUserDao;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImp implements IUserService {

	protected final Logger LOGGER = Logger.getLogger(getClass());

	@Autowired
	IUserDao userDao;

	@Autowired
	private PasswordEncoder passwordEncoder;


	public void creeUser(User user) {
		String encryptedPassword = passwordEncoder.encode(user.getMotDePasse());
		user.setMotDePasse(encryptedPassword);
		try {
			userDao.save(user);
		} catch (DataIntegrityViolationException ex) {
			LOGGER.error("Integrity constraint violation occurred: " + ex.getMessage());
			throw ex;
		}
	}


}
