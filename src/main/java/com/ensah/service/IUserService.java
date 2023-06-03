package com.ensah.service;

import com.ensah.bo.User;

public interface IUserService {

	public void creeUser(User user);
	public void modifierUser(User user);

	public User getUserByTele(String num);

	public void modifierUserMDP(User user,String OldMotDePasse,String NewMotDePasse);
}


