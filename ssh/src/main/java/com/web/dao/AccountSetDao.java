package com.web.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.AccountSet;

@Repository
public class AccountSetDao {
	@Resource
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void add(AccountSet accountSet){
		sessionFactory.getCurrentSession().save(accountSet);
	}
	
	public boolean delete(int id){
		String hql="delete AccountSet a where a.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,id);
		return (query.executeUpdate()>0);
	}
	
	public boolean update(AccountSet accountSet){
		String hql="update AccountSet a set a.name=?,a.date=?,a.place=?,a.vat=?,a.as=?,a.period=?,a.isdefault=? where a.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, accountSet.getName());
		query.setDate(1, accountSet.getDate());
		query.setString(2, accountSet.getPlace());
		query.setBoolean(3, accountSet.isVat());
		query.setBoolean(4, accountSet.isAs());
		query.setInteger(5, accountSet.getPeriod());
		query.setBoolean(6, accountSet.isIsdefault());
		query.setInteger(7, accountSet.getId());
		return (query.executeUpdate()>0);
	}
	
	public void saveOrUpdate(AccountSet accountSet){
		sessionFactory.getCurrentSession().saveOrUpdate(accountSet);
	}
	
	public AccountSet get(int id){
		String hql="from AccountSet a where a.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (AccountSet) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<AccountSet> getAll(){
		String hql="from AccountSet";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	public AccountSet getDefault(){
		String hql="from AccountSet a where a.isdefault=true";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (AccountSet) query.uniqueResult();
	}
}
