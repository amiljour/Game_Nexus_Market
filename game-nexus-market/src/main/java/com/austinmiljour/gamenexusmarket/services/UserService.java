package com.austinmiljour.gamenexusmarket.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.austinmiljour.gamenexusmarket.models.LoginUser;
import com.austinmiljour.gamenexusmarket.models.User;
import com.austinmiljour.gamenexusmarket.repositories.UserRepository;

@Service
public class UserService {
	
	private final UserRepository userRepo;

	public UserService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}
	
	public User register(User newUser, BindingResult result) {
		// check if the email exists
		// find the user in the DB by email
		Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
		// if the email exists, reject register
		if(optionalUser.isPresent()) {
			// input type checked || category of the error || message displayed
			result.rejectValue("email", "unique", "This email is registered.");
		}
		// reject if the password doesn't match confirm password
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "match", "The passwords do not match.");
		}
		// if result has errors, return
		if(result.hasErrors()) {
			return null;
		}
		// hash password
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		// set the password as the hashed password
		newUser.setPassword(hashed);
		// save the user
		User registeredUser = userRepo.save(newUser);
		// return the user
		return registeredUser;
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		// find the user in the DB by email
		Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
		// reject if the user is not present in the DB
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "unique", "This email is not registered.");
			return null;
		}
		// Get the potentialUser info from the DB
		User loggedUser = potentialUser.get();
		// check if the BCrypt password matches
		if(!BCrypt.checkpw(newLogin.getPassword(), loggedUser.getPassword())) {
		    result.rejectValue("password", "match", "Invalid Password.");
		}
		if (result.hasErrors()) {
			return null;
		}
		// If all checks pass return user
		return loggedUser;
	}

}