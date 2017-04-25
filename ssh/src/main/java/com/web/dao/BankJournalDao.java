package com.web.dao;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.Bank;
import com.web.entity.BankJournal;

@Repository
public class BankJournalDao {

	@Resource
	private SessionFactory sessionFactory;
	
	public void add(BankJournal bankJournal){
		sessionFactory.getCurrentSession().save(bankJournal);
	}
	
	public boolean delete(int id){
		String hql="delete BankJournal j where j.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (query.executeUpdate()>0);
	}
	
	public boolean update(BankJournal bankJournal){
		String hql="update BankJournal j set j.date=?,j.description=?,j.ietype=?,j.income=?,j.expenditure=?,j.optype=?,j.paymentMethod=?,j.receiptNumber=?,j.bank=?,j.solved=?,j.period=? where j.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setDate(0,bankJournal.getDate());
		query.setString(1, bankJournal.getDescription());
		query.setEntity(2, bankJournal.getIetype());
		query.setDouble(3, bankJournal.getIncome());
		query.setDouble(4, bankJournal.getExpenditure());
		query.setString(5, bankJournal.getOptype());
		query.setString(6, bankJournal.getPaymentMethod());
		query.setInteger(7, bankJournal.getReceiptNumber());
		query.setEntity(8, bankJournal.getBank());
		query.setBoolean(9, bankJournal.isSolved());
		query.setInteger(10, bankJournal.getPeriod());
		query.setInteger(11, bankJournal.getId());
		return (query.executeUpdate()>0);
	}
	
	public void update2(BankJournal bankJournal){
		sessionFactory.getCurrentSession().saveOrUpdate(bankJournal);
	}
	
	public BankJournal get(int id){
		String hql="from BankJournal j where j.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (BankJournal) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<BankJournal> getAll(){
		String hql="from BankJournal";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public int getCount(){
		String sql="select AUTO_INCREMENT from information_schema.tables where table_name='bankjournal'";
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
	public List<BankJournal> search(Bank bank,Date date1,Date date2){
		String hql="from BankJournal j where j.bank=? and j.date between ? and ?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setEntity(0, bank);
		query.setDate(1, date1);
		query.setDate(2, date2);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<BankJournal> searchNoBank(Date date1,Date date2){
		String hql="from BankJournal j where j.date between ? and ? and j.accountSet=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setDate(0, date1);
		query.setDate(1, date2);
		return query.list();
	}
	
	//计算当前日期有多少条记录
	public int getCountByDate(Date date){
		String hql="select count(id) from BankJournal where date=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setDate(0, date);
		return (int) query.uniqueResult();
	}
	
	//查询该bank下的所有bankJournal
	@SuppressWarnings("unchecked")
	public List<BankJournal> getAllByBank(Bank bank){
		String hql="from BankJournal bj where bj.bank=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setEntity(0, bank);
		return query.list();
	}
}
