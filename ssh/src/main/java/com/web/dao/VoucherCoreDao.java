package com.web.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.AccountingSubject;
import com.web.entity.VoucherCore;

@Repository
public class VoucherCoreDao {
	@Resource
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void add(VoucherCore voucherCore){
		sessionFactory.getCurrentSession().save(voucherCore);
	}
	
	public boolean delete(int id){
		String hql="delete VoucherCore vc where vc.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (query.executeUpdate()>0);
	}
	
	public boolean update(VoucherCore voucherCore){
		String hql="update VoucherCore vc set vc.summary=?,vc.debits=?,vc.credits=?,vc.accountingSubject=? where vc.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, voucherCore.getSummary());
		query.setDouble(1, voucherCore.getDebits());
		query.setDouble(2, voucherCore.getCredits());
		query.setEntity(3, voucherCore.getAccountingSubject());
		query.setInteger(4, voucherCore.getId());
		return (query.executeUpdate()>0);
	}
	
	public void update2(VoucherCore voucherCore){
		sessionFactory.getCurrentSession().saveOrUpdate(voucherCore);;
	}
	
	public VoucherCore get(int id){
		String hql="from VoucherCore vc where vc.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (VoucherCore) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<VoucherCore> getAll(){
		String hql="from VoucherCore";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<VoucherCore> getMul(AccountingSubject accountingSubject){
		String hql="from VoucherCore v where v.accountingSubject=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setEntity(0, accountingSubject);
		return query.list();
	}
}
