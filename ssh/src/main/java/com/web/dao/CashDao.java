package com.web.dao;

import java.math.BigInteger;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.Cash;

@Repository
public class CashDao {
	@Resource
	private SessionFactory sessionFactory;
	
	public void add(Cash cash){
		sessionFactory.getCurrentSession().save(cash);
	}
	
	public boolean delete(int id){
		String hql="delete Cash c where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (query.executeUpdate()>0);
	}
	
	public boolean update(Cash cash){
		String hql="update Cash c set c.name=?,c.current=?,c.accountingSubject=?,c.balance=? where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, cash.getName());
		query.setEntity(1, cash.getCurrent());
		query.setEntity(2, cash.getAccountingSubject());
		query.setDouble(3, cash.getBalance());
		query.setInteger(4, cash.getId());
		return (query.executeUpdate()>0);
	}
	public void update2(Cash cash){
		sessionFactory.getCurrentSession().update(cash);
	}
	
	public Cash get(int id){
		String hql="from Cash c where c.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (Cash) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Cash> getAll(){
		String hql="from Cash";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	//这里需要查询auto_increment,而不能仅仅max，如果最近添加的删除了，id就会错位一个
	public int getCount(){
		String sql="select AUTO_INCREMENT from information_schema.tables where table_name='cash'";
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
