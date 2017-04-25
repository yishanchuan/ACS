package com.web.dao;

import java.math.BigInteger;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.Bank;


@Repository
public class BankDao {
	@Resource
	private SessionFactory sessionFactory;
	
	public void add(Bank bank){
		sessionFactory.getCurrentSession().save(bank);
	}
	
	public boolean delete(int id){
		String hql="delete Bank c where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (query.executeUpdate()>0);
	}
	
	public boolean update(Bank bank){
		String hql="update Bank b set b.name=?,b.bankAccount=?,b.current=?,b.accountingSubject=?,b.balance=?"
				+ "where b.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, bank.getName());
		query.setString(1, bank.getBankAccount());
		query.setEntity(2, bank.getCurrent());
		query.setEntity(3, bank.getAccountingSubject());
		query.setDouble(4, bank.getBalance());
		query.setInteger(5, bank.getId());
		return (query.executeUpdate()>0);
	}
	public void update2(Bank bank){
		sessionFactory.getCurrentSession().update(bank);
	}
	
	public Bank get(int id){
		String hql="from Bank c where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (Bank) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Bank> getAll(){
		String hql="from Bank";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	public int getCount(){
		String sql="select AUTO_INCREMENT from information_schema.tables where table_name='bank'";
		SQLQuery sqlQuery=sessionFactory.getCurrentSession().createSQLQuery(sql);
		if(sqlQuery.uniqueResult()==null){
			return 0;
		}else{
			//mysql自增变量是BigInteger类型，不可直接cast
			BigInteger bi=(BigInteger) sqlQuery.uniqueResult();
			return bi.intValue()-1;
		}
	}
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
