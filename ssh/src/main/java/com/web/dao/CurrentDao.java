package com.web.dao;

import java.math.BigInteger;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.Current;

@Repository
public class CurrentDao {

	@Resource
	private SessionFactory sessionFactory;
	
	public void add(Current current){
		sessionFactory.getCurrentSession().save(current);
	}
	
	public boolean delete(int id){
		String hql="delete Current c where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (query.executeUpdate()>0);
	}
	
	public boolean update(Current current){
		String hql="update Current c set c.code=?,c.name=?,c.rate=?,c.standard=?"
				+ "where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, current.getCode());
		query.setString(1, current.getName());
		query.setFloat(2, current.getRate());
		query.setBoolean(3, current.isStandard());
		query.setInteger(4, current.getId());
		return (query.executeUpdate()>0);
	}
	
	public void update2(Current current){
		sessionFactory.getCurrentSession().update(current);
	}
	
	public Current get(int id){
		String hql="from Current c where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (Current) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Current> getAll(){
		String hql="from Current";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	public int getCount(){
		String sql="select AUTO_INCREMENT from information_schema.tables where table_name='current'";
		SQLQuery sqlQuery=sessionFactory.getCurrentSession().createSQLQuery(sql);
		if(sqlQuery.uniqueResult()==null){
			return 0;
		}else{
			//mysql自增变量是BigInteger类型，不可直接cast
			BigInteger bi=(BigInteger) sqlQuery.uniqueResult();
			return bi.intValue();
		}
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
