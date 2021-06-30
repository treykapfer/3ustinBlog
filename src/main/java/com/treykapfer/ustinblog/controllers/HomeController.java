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
import com.treykapfer.ustinblog.services.CommentService;
import com.treykapfer.ustinblog.services.PostService;
import com.treykapfer.ustinblog.services.UserService;
import com.treykapfer.ustinblog.validations.UserValidator;

@Controller
public class HomeController {
	
	private UserService userServ;
	private UserValidator userVal;
	private PostService postService;
	private CommentService commentService;

	public HomeController(UserService userServ, UserValidator userVal, PostService postService, CommentService commentService) {
		this.userServ = userServ;
		this.userVal = userVal;
		this.postService = postService;
		this.commentService = commentService;
	}
	
	//pass in model attribute user
	@GetMapping("/")
	public String login(@ModelAttribute("user") User user, Model model) {
		List<Post> posts = postService.allPosts();
		model.addAttribute("posts",posts);
		return "login.jsp";
	}
	
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
			return "redirect:/home";
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

	@RequestMapping("/post/{id}")
	public String post(@PathVariable("id") Long id, @ModelAttribute("comment") Comment comment, Model model){
		Post post = postService.findOneByID(id);
		List<Comment> comments = commentService.allComments();
		model.addAttribute("post",post);
		model.addAttribute("comments", comments);
		return "post.jsp";
	}

	@RequestMapping(value="/post/{id}/newComment", method=RequestMethod.POST)
	public String postNewComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result, @PathVariable("id") Long id, Model model, HttpSession session){
		//Grabbing Post, User, and Comment Content for a new Comment.
		Post post = postService.findOneByID(id);
		User user = userServ.findUserById(Long.valueOf(session.getAttribute("userID").toString()));
		Comment newComment= new Comment();
		//Storing all the values into a new comment.
		newComment.setContent(comment.getContent());
		newComment.setPost(post);
		newComment.setUser(user);
		//Creating a new comment.
		commentService.createComment(newComment);
		return "redirect:/post/" + id;
		
	}

}
