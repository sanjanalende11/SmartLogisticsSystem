package com.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.User;

@Repository
public class UserDAO {
	
	@Autowired
    SessionFactory sessionFactory;

    public void save(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    public User getUser(String username, String password) {
        return sessionFactory.getCurrentSession()
            .createQuery("from User where username=:u and password=:p", User.class)
            .setParameter("u", username)
            .setParameter("p", password)
            .uniqueResult();
    }

	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		String hql = "from User where username=:uname";
	    return sessionFactory.getCurrentSession()
	        .createQuery(hql, User.class)
	        .setParameter("uname", username)
	        .uniqueResult();
	}

	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		String hql = "from User where email=:email";
	    return sessionFactory.getCurrentSession()
	            .createQuery(hql, User.class)
	            .setParameter("email", email)
	            .uniqueResult();
	}

	public User findByToken(String token) {
		// TODO Auto-generated method stub
		String hql = "from User where resetToken=:token";
	    return sessionFactory.getCurrentSession()
	            .createQuery(hql, User.class)
	            .setParameter("token", token)
	            .uniqueResult();
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

}
