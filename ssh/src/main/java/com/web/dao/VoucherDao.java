package com.web.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.Voucher;

@Repository
public class VoucherDao {
	@Resource 
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void add(Voucher voucher){
		sessionFactory.getCurrentSession().save(voucher);
	}
	
	public boolean delete(int id){
		String hql="delete Voucher v where v.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (query.executeUpdate()>0);
	}
	
	public void update2(Voucher voucher){
		sessionFactory.getCurrentSession().update(voucher);
	}
	public boolean update(Voucher voucher){
		String hql="update Voucher v set v.vouchergroup=?,v.vchnum=?,v.period=?,"
				+ "v.date=?,v.voucherstatus=?,v.poststatus=?,v.total=?,v.user=?,"
				+ "v.solved=? where v.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setEntity(0, voucher.getVouchergroup());
		query.setInteger(1,voucher.getVchnum());
		query.setInteger(2, voucher.getPeriod());
		query.setDate(3, voucher.getDate());
		query.setBoolean(4, voucher.isVoucherstatus());
		query.setBoolean(5, voucher.isPoststatus());
		query.setDouble(6, voucher.getTotal());
		query.setEntity(7, voucher.getUser());
		query.setBoolean(8, voucher.isSolved());
		query.setInteger(9, voucher.getId());
		return (query.executeUpdate()>0);
	}
	
	public Voucher get(int id){
		String hql="from Voucher v where v.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (Voucher) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Voucher> getAll(){
		String hql="from Voucher";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	/*获取vchnum凭证序号最大值
	 * */
	public int getVchnum(){
		String hql="select max(vchnum) from Voucher";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		if(query.uniqueResult()==null){
			return 0;
		}else{
			//Long x=(Long) query.uniqueResult();
			return (int) query.uniqueResult();
		}
	}
}
