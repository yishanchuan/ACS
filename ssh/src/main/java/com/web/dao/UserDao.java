package com.web.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.User;
@Repository
public class UserDao{
	@Resource
	private SessionFactory sessionFactory;
	
	public void add(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	public boolean delete(int id) {
		String hql = "delete User u where u.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  
        query.setInteger(0, id);  
          
        return (query.executeUpdate() > 0);
	}

	public boolean update(User user) {
		String hql = "update User u set u.userName=?,u.password=?,u.role=?,u.email=?,u.tel=? where u.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  
        query.setString(0, user.getUserName());  
        query.setString(1, user.getPassword()); 
        query.setEntity(2, user.getRole());
        query.setString(3, user.getEmail());
        query.setString(4, user.getTel());
        query.setInteger(5, user.getId());  
        return (query.executeUpdate() > 0); 
	}

	public User get(int id) {
		String hql = "from User u where u.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);//此时使用的是hql语句  
        query.setInteger(0, id);
        return (User) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<User> getAll() {
		String hql="from User";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public User getByName(String userName){
		String hql="from User u where u.userName=? or u.email=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, userName);
		query.setString(1, userName);
		return (User)query.uniqueResult();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
