package com.treykapfer.ustinblog.services;


import java.util.List;
import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.treykapfer.ustinblog.models.Comment;
import com.treykapfer.ustinblog.repositories.CommentRepository;

@Service
public class CommentService {
    // adding the comment repository as a dependency
    private final CommentRepository CommentRepository;
    
    public CommentService(CommentRepository commentRepository) {
        this.CommentRepository = commentRepository;
    }
    // returns all the comments
    public List<Comment> allComments() {
        return CommentRepository.findAll();
    }
    // creates a comment
    public Comment createComment(Comment b) {
        return CommentRepository.save(b);
    }
    // retrieves a comment
    public Comment findOneByID(Long id) {
        Optional<Comment> optionalComment = CommentRepository.findById(id);
        if(optionalComment.isPresent()) {
            return optionalComment.get();
        } else {
            return null;
        }
    }

	public Comment updateComment(Comment comment) {
			return CommentRepository.save(comment);
		}
	
	public void deleteComment(Long id) {
		System.out.println(id + " comment deleted");
		CommentRepository.deleteById(id);
	}
}