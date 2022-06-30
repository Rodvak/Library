package com.alex.finalProject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alex.finalProject.models.Baby;
import com.alex.finalProject.models.User;
import com.alex.finalProject.services.BabyService;
import com.alex.finalProject.services.UserService;

@Controller
public class BabyController {
	
	@Autowired
	private BabyService babyService;
	
	@Autowired
	private UserService userService;
	
	// RENDER CREATE BABY
		@GetMapping("/names/new")
		public String create(@ModelAttribute("baby") Baby baby, HttpSession session, Model model) {
			Long userId = (Long) session.getAttribute("user_id");
			// Check if userID is null
			if (userId == null) {
				return "redirect:/";
			} else {
				User loggedUser = userService.findOne(userId);
				model.addAttribute("loggedUser", loggedUser);
				List<Baby>allBabys = babyService.allBabys();
				model.addAttribute("allBabys", allBabys);
				return "create.jsp";		
			}
		}
		
		
		// CREATE BABY FORM 
		@PostMapping("/create/baby")
		public String createBaby(@Valid @ModelAttribute("baby") Baby baby,
				BindingResult result,
				Model model,
				HttpSession session) {
			Long userId = (Long) session.getAttribute("user_id");
			// Check if userID is null
			if (userId == null) {
				return "redirect:/";
			} else {
			if (result.hasErrors()) {
				List<Baby>allBabys = babyService.allBabys();
				model.addAttribute("allBabys", allBabys);
				return "create.jsp";
			} else {
				babyService.createBaby(baby);
				return "redirect:/home";
			}
				
			}
			
		}
		
		
		// SHOW BABY
		@RequestMapping("/babys/{id}")
		public String showBaby( @PathVariable("id") Long id, Model model,
				HttpSession session) {
			Long userId = (Long) session.getAttribute("user_id");
			// Check if userID is null
			if (userId == null) {
				return "redirect:/";	
			} else {
				User loggedUser = userService.findOne(userId);
				model.addAttribute("loggedUser", loggedUser);
				Baby baby = babyService.findBaby(id);
				model.addAttribute("baby", baby);
				return "show.jsp";
			}
		}
		
		
		// RENDER EDIT
		@RequestMapping("/babys/{id}/edit")
		public String edit(@PathVariable("id") Long id, Model model,
				HttpSession session) {
			Long userId = (Long) session.getAttribute("user_id");
			// Check if userID is null
			if (userId == null) {
				return "redirect:/";
			} else {
			Baby baby = babyService.findBaby(id);
			model.addAttribute("baby", baby);
			return "edit.jsp";
			}
		}
		
		
		// BABY EDIT UPDATE
		@PutMapping("/babys/{id}")
		public String editbaby(@Valid @ModelAttribute("baby") Baby baby,
				BindingResult result,
				HttpSession session) {
			Long userId = (Long) session.getAttribute("user_id");
			// Check if userID is null
			if (userId == null) {
				return "redirect:/";
			} else {	
			if (result.hasErrors()) {
				return "edit.jsp";
			} else {
				babyService.updateBaby(baby);
				return "redirect:/home";
			}
		}
	}
		// DELETEMAPPING HAS TO HAVE A FORM INSIDE SHOW PAGE
		@DeleteMapping("/delete/{id}")
		public String delete(@PathVariable("id")Long id) {
			babyService.deleteBaby(id);
			return "redirect:/home";
		}

}
