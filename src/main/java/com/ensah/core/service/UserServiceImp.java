package com.ensah.core.service;

import com.ensah.core.bo.User;
import com.ensah.core.dao.IUserDao;
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

	@Override
	public void modifierUser(User user) {
		try {
			userDao.save(user);
		} catch (DataIntegrityViolationException ex) {
			LOGGER.error("Integrity constraint violation occurred: " + ex.getMessage());
			throw ex;
		}
	}

	@Override
	public User getUserByTele(String num) {

		return userDao.findByTelephone(num);
	}

	@Override
	public void modifierUserMDP(User user, String OldMotDePasse, String NewMotDePasse) {

			if (passwordEncoder.matches(OldMotDePasse, user.getMotDePasse())) {
				String encryptedPassword = passwordEncoder.encode(NewMotDePasse);
				user.setMotDePasse(encryptedPassword);
				userDao.save(user);
			} else {
				throw new IllegalArgumentException("Verifier votre ancien mdp!");
			}
	}

}
