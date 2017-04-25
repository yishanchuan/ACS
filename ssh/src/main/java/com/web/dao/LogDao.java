package com.web.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.Log;

@Repository
public class LogDao {
	@Resource
	private SessionFactory sessionFactory;
	
	public void add(Log log){
		sessionFactory.getCurrentSession().save(log);
	}
	
	public boolean delete(int id) {
		String hql = "delete Log l where l.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  
        query.setInteger(0, id);  
          
        return (query.executeUpdate() > 0);
	}

	public boolean update(Log log) {
		String hql = "update Log l set l.user_id=?,l.date=?,l.type=?,l.module=?,l.content=? where l.logid=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  
        query.setInteger(0, log.getUser().getId());
        query.setDate(1, log.getDate());
        query.setString(2, log.getType());
        query.setString(3, log.getModual());
        query.setString(4, log.getContent());
        return (query.executeUpdate() > 0); 
	}

	public Log get(int id) {
		String hql = "from Log l where l.logid=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);//此时使用的是hql语句  
        query.setInteger(0, id);
        return (Log) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<Log> getAll() {
		String hql="from Log";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
