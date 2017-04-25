package com.web.dao;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.Cash;
import com.web.entity.Journal;

@Repository
public class JournalDao {

	@Resource
	private SessionFactory sessionFactory;
	
	public void add(Journal journal){
		sessionFactory.getCurrentSession().save(journal);
	}
	
	public boolean delete(int id){
		String hql="delete Journal j where j.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (query.executeUpdate()>0);
	}
	
	public boolean update(Journal journal){
		String hql="update Journal j set j.date=?,j.description=?,j.ietype=?,j.income=?,j.expenditure=?,j.optype=?,j.paymentMethod=?,j.receiptNumber=?,j.cash=?,j.solved=?,j.period=? where j.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setDate(0,journal.getDate());
		query.setString(1, journal.getDescription());
		query.setEntity(2, journal.getIetype());
		query.setDouble(3, journal.getIncome());
		query.setDouble(4, journal.getExpenditure());
		query.setString(5, journal.getOptype());
		query.setString(6, journal.getPaymentMethod());
		query.setInteger(7, journal.getReceiptNumber());
		query.setEntity(8, journal.getCash());
		query.setBoolean(9, journal.isSolved());
		query.setInteger(10, journal.getPeriod());
		query.setInteger(11, journal.getId());
		return (query.executeUpdate()>0);
	}
	
	public void update2(Journal journal){
		sessionFactory.getCurrentSession().saveOrUpdate(journal);
	}
	
	
	public Journal get(int id){
		String hql="from Journal j where j.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (Journal) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Journal> getAll(){
		String hql="from Journal";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public int getCount(){
		String sql="select AUTO_INCREMENT from information_schema.tables where table_name='journal'";
		SQLQuery sqlQuery=sessionFactory.getCurrentSession().createSQLQuery(sql);
		if(sqlQuery.uniqueResult()==null){
			return 0;
		}else{
			//mysql自增变量是BigInteger类型，不可直接cast
			BigInteger bi=(BigInteger) sqlQuery.uniqueResult();
			return bi.intValue();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Journal> search(Cash cash,Date date1,Date date2){
		String hql="from Journal j where j.cash=? and j.date between ? and ?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setEntity(0, cash);
		query.setDate(1, date1);
		query.setDate(2, date2);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Journal> searchNoCash(Date date1,Date date2){
		String hql="from Journal j where j.date between ? and ?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setDate(0, date1);
		query.setDate(1, date2);
		return query.list();
	}
	//计算当前日期有多少条记录
	public int getCountByDate(Date date){
		String hql="select count(id) from Journal where date=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setDate(0, date);
		return (int) query.uniqueResult();
	}
	
	//查询该cash下的所有journal
	@SuppressWarnings("unchecked")
	public List<Journal> getAllByCash(Cash cash){
		String hql="from Journal j where j.cash=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setEntity(0, cash);
		return query.list();
	}
}
