package com.alex.finalProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.alex.finalProject.models.Baby;


public interface BabyRepository extends CrudRepository<Baby, Long> {
	
	List<Baby> findAll();

}
