package com.treykapfer.ustinblog.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.treykapfer.ustinblog.models.*;
import com.treykapfer.ustinblog.services.PostService;
import com.treykapfer.ustinblog.services.UserService;
import com.treykapfer.ustinblog.validations.UserValidator;

@Controller
public class HomeController {
	
	private UserService userServ;
	private UserValidator userVal;
	private PostService postService;

	public HomeController(UserService userServ, UserValidator userVal, PostService postService) {
		this.userServ = userServ;
		this.userVal = userVal;
		this.postService = postService;
	}
	
	//pass in model attribute user
	@GetMapping("/")
	public String login(@ModelAttribute("user") User user) {
		return "login.jsp";
	}
	
	
	//*****************
	//LOGIN REG POST MAPPING
	@PostMapping("/registration")
	public String register(@Valid @ModelAttribute("user") User newUser, BindingResult result, HttpSession session) {
		//add validator
		userVal.validate(newUser, result);
		
		//regular checks
		if(result.hasErrors()) {
			System.out.println(result);
			return "login.jsp";
		} else {
			User u = userServ.registerUser(newUser);
			session.setAttribute("sesUser", u);
			session.setAttribute("userID", u.getId());
			return "redirect:/";
		}
	}
	
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    	boolean isAuth = userServ.authenticateUser(email, password);
    	if(isAuth) {
    		User sesUser = userServ.findByEmail(email);
    		session.setAttribute("sesUser", sesUser);
    		session.setAttribute("userID", sesUser.getId());
    		return "redirect:/home";
    	}
    	redirectAttributes.addFlashAttribute("error", "Invalid credientials. Please try again.");
	    return "redirect:/";
    }

	@RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
	}
	
	@RequestMapping("/about")
    public String about() {
    	return "about.jsp";
	}

	@RequestMapping("/home")
    public String home(Model model) {
		List<Post> posts = postService.allPosts();
		model.addAttribute("posts",posts);
    	return "home.jsp";
	}

	@RequestMapping("/post")
	public String post_1(){
		return "post.jsp";
	}

}
