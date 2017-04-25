package com.web.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.IEType;

@Repository
public class IETypeDao {

	@Resource
	private SessionFactory sessionFactory;
	
	public void add(IEType iEType){
		sessionFactory.getCurrentSession().save(iEType);
	}
	
	public boolean delete(int id){
		String hql="delete IEType c where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (query.executeUpdate()>0);
	}
	
	public boolean update(IEType iEType){
		String hql="update Income c set c.name=?,c.ie=? where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, iEType.getName());
		query.setBoolean(1, iEType.isIe());
		query.setInteger(2, iEType.getId());
		return (query.executeUpdate()>0);
	}
	
	public IEType get(int id){
		String hql="from IEType c where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (IEType) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<IEType> getAll(){
		String hql="from IEType";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	public int getCount(){
		String hql="select max(id) from IEType";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		if(query.uniqueResult()==null){
			return 0;
		}else{
			return (int) query.uniqueResult();
		}
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
