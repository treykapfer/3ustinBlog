package com.treykapfer.ustinblog.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.data.annotation.Transient;

//error found not calling on idea
import com.treykapfer.beltexam.models.Idea;

@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="Username field cannot be empty")
    @Size(min = 3, message="Username must be at least 3 characters")
    private String username;
    
    @NotEmpty(message="Email field cannot be empty")
    @Email(message="You must enter a valid email address")
    private String email;
    
    @NotEmpty(message="Password field cannot be empty")
    @Size(min = 8, message="Password must be at least 8 characters long")
    private String password;
    
    @Transient
    @NotEmpty(message="Confirm Password field cannot be empty")
    @Size(min = 8, message="Password must be at least 8 characters long")
    private String passwordConfirmation;
    
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Idea> ideas;
    
    //constructors
    public User() {
    }
    
    public List<Idea> getIdeas() {
		return ideas;
	}

	public void setIdeas(List<Idea> ideas) {
		this.ideas = ideas;
	}

	//getters/setters
    public Long getId() {
  		return id;
  	}

  	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setId(Long id) {
  		this.id = id;
  	}

  	public String getEmail() {
  		return email;
  	}

  	public void setEmail(String email) {
  		this.email = email;
  	}

  	public String getPassword() {
  		return password;
  	}

  	public void setPassword(String password) {
  		this.password = password;
  	}

  	public String getPasswordConfirmation() {
  		return passwordConfirmation;
  	}

  	public void setPasswordConfirmation(String passwordConfirmation) {
  		this.passwordConfirmation = passwordConfirmation;
  	}

  	public Date getCreatedAt() {
  		return createdAt;
  	}

  	public void setCreatedAt(Date createdAt) {
  		this.createdAt = createdAt;
  	}

  	public Date getUpdatedAt() {
  		return updatedAt;
  	}

  	public void setUpdatedAt(Date updatedAt) {
  		this.updatedAt = updatedAt;
  	}
    
    //add extra
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }

	@PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}