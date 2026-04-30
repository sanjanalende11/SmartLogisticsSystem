package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDAO;
import com.model.User;

@Service
 public class UserService {

	@Autowired
	UserDAO userDAO;
	
	@Transactional
	public void saveUser(User user) {
        userDAO.save(user);
    }

	@Transactional
    public User checkLogin(User user) {
        return userDAO.getUser(user.getUsername(), user.getPassword());
    }

	@Transactional
	public User login(User c) {
		// TODO Auto-generated method stub
		return checkLogin(c);
	}

	@Transactional
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userDAO.getUserByUsername(username);
	}

	@Transactional
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return userDAO.findByEmail(email);
	}

	@Transactional
	public User findByToken(String token) {
		// TODO Auto-generated method stub
		return userDAO.findByToken(token);
	}

	@Transactional
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDAO.updateUser(user);
	}
}
