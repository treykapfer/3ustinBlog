package com.treykapfer.ustinblog.services;


import java.util.List;
import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.treykapfer.ustinblog.models.Post;
import com.treykapfer.ustinblog.repositories.PostRepository;

@Service
public class PostService {
    // adding the post repository as a dependency
    private final PostRepository PostRepository;
    
    public PostService(PostRepository postRepository) {
        this.PostRepository = postRepository;
    }
    // returns all the posts
    public List<Post> allPosts() {
        return PostRepository.findAll();
    }
    // creates a post
    public Post createPost(Post b) {
        return PostRepository.save(b);
    }
    // retrieves a post
    public Post findOneByID(Long id) {
        Optional<Post> optionalPost = PostRepository.findById(id);
        if(optionalPost.isPresent()) {
            return optionalPost.get();
        } else {
            return null;
        }
    }

	public Post updatePost(Post post) {
			return PostRepository.save(post);
		}
	
	public void deletePost(Long id) {
		System.out.println(id + " post deleted");
		PostRepository.deleteById(id);
	}
}