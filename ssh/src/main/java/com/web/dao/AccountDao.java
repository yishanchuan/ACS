package com.web.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.AccountSelect;
import com.web.entity.Voucher;

@Repository
public class AccountDao {
	@Resource
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<AccountSelect> getUsedAccoutingSubject(){
		String sql="select distinct a.id,a.name FROM VoucherCore as v,AccountingSubject AS a WHERE v.accountingsubject_id=a.id ORDER BY a.id";
		return sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(AccountSelect.class).list();
	}
	
	public Voucher getVoucherByVCid(int id){
		String sql="select * from voucher where voucher.id=(select voucher_id from vouchercore where id=?)";
		Query query=sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(Voucher.class);
		query.setInteger(0, id);
		return (Voucher) query.uniqueResult();
	}
	
}
