package com.alex.finalProject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.alex.finalProject.models.LoginUser;
import com.alex.finalProject.models.User;
import com.alex.finalProject.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User register(User newUser, BindingResult result) {
		// REJECT IF THE EMAIL IS ALREADY IN USE
		Optional <User> potentialUser = userRepository.findByEmail(newUser.getEmail());
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "registerErrors", "Email already in use.");	
		}
		// REJECT IF PASSWORD DON'T MATCH WITH CONFIRM
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "registerErrors", "Paswords must match.");	
		}
		if (result.hasErrors()) {
			return null;
		} else {
			// HASH THE PASSWORD & SAVE NEW USER TO DB
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
					newUser.setPassword(hashed);
					// SAVE USER TO DB
					return userRepository.save(newUser);
		}
	}
	
	
    public User login(LoginUser newLoginObject, BindingResult result) {
    	
    	// 	FIND THE USER IN THE DB
    	Optional<User> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());
    	if (!potentialUser.isPresent()) {
    		result.rejectValue("email", "loginError", "Email not found");
    	} else {
    		
    		User user = potentialUser.get();
//    	Reject if BCrypt pass match fails
    		if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
//    		Reject
    			result.rejectValue("password", "loginError", "Invalid password");
    		}
//    	return null if result has errors
    		if (result.hasErrors()) {
    			return null;
    		} else {
//    		otherwise, return the user object
    			return user;
    		}
    	}
    	
    	return null;
    	
    	}
	
	public User findOne(Long id) {
		Optional<User> potentialUser = userRepository.findById(id);
		if (potentialUser.isPresent()) {
			return potentialUser.get();
		} else {
			return null;
		}
	}

}
