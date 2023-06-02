package com.ensah.service;

import com.ensah.bo.Groupe;
import com.ensah.bo.User;
import com.ensah.dao.IUserDao;
import com.ensah.security.UserPrinciple;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MyUserDeatailsService implements UserDetailsService {

	protected final Logger LOGGER = Logger.getLogger(getClass());

	@Autowired
	IUserDao userDao;

	public void creeUser(User user) {
		try {
			userDao.save(user);
		} catch (DataIntegrityViolationException ex) {
			LOGGER.error("Integrity constraint violation occurred: " + ex.getMessage());
			throw ex;
		}
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {


		User user = userDao.findByTelephone(username);

		if (user == null){
			throw new UsernameNotFoundException("user non trouve");
		}
		return new UserPrinciple(user);
	}

}
