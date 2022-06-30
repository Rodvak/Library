package com.alex.finalProject.services;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alex.finalProject.models.Baby;
import com.alex.finalProject.repositories.BabyRepository;



@Service
public class BabyService {
	
	@Autowired
	private BabyRepository babyRepository;
	
	public BabyService(BabyRepository baby) {
		this.babyRepository = baby;
	}
	
	// FINDS ALL BABYS
	public List<Baby> allBabys() {
		return babyRepository.findAll();
	}
	
	
	// CREATES A BABY
	public Baby createBaby(Baby baby) {
		return babyRepository.save(baby);
	}
	
	
	// RETRIEVES A BABY BY ID
	public Baby findBaby(Long id) {
		Optional<Baby> optionalBaby = babyRepository.findById(id);
		if (optionalBaby.isPresent()) {
			return optionalBaby.get();
		} else {
			return null;
		}
	}
	
		
	//UPDATES A BABY
	public Baby updateBaby(Baby baby) {
		return babyRepository.save(baby);
	}
	
	
	// DELETES A BABY
	public void deleteBaby(Long id) {
		babyRepository.deleteById(id);
	}
	

}
