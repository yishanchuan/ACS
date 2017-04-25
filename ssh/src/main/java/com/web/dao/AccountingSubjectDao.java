package com.web.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.AccountingSubject;

@Repository
public class AccountingSubjectDao {
	@Resource
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void add(AccountingSubject as){
		sessionFactory.getCurrentSession().save(as);
	}
	
	public boolean delete(int id) {
		String hql = "delete AccountingSubject l where l.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  
        query.setInteger(0, id);  
        return (query.executeUpdate() > 0);
	}

	public boolean update(AccountingSubject as) {
		String hql = "update AccountingSubject l set l.name=?,l.dc=?,l.type=?,l.status=?,l.balance=? where l.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  
        query.setString(0, as.getName());
        query.setBoolean(1, as.isDc());
        query.setString(2, as.getType());
        query.setBoolean(3, as.isStatus());
        query.setDouble(4, as.getBalance());
        query.setInteger(5, as.getId());
        return (query.executeUpdate()>0); 
	}

	public AccountingSubject get(int id) {
		String hql = "from AccountingSubject l where l.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);//此时使用的是hql语句  
        query.setInteger(0, id);
        return (AccountingSubject) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<AccountingSubject> getAll() {
		String hql="from AccountingSubject";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public double calculate(boolean dc){
		String sql="select sum(balance) from accountingsubject where dc=?";
		Query query=sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(Double.class);
		query.setBoolean(0, dc);
		return (double) query.uniqueResult();
	}
}
