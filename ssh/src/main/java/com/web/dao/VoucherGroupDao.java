package com.web.dao;

import java.util.List;

import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.entity.VoucherGroup;

@Repository
public class VoucherGroupDao {
	@Resource
	private SessionFactory sessionFactory;
	
	public void add(VoucherGroup vg) {
		sessionFactory.getCurrentSession().save(vg);
	}

	public boolean delete(int id) {
		String hql = "delete VoucherGroup u where u.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  
        query.setInteger(0, id);  
          
        return (query.executeUpdate() > 0);
	}

	public boolean update(VoucherGroup vg) {
		String hql = "update VoucherGroup u set u.name=?,u.title=?,u.isdefault=? where u.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  
        query.setString(0, vg.getName());  
        query.setString(1, vg.getTitle());  
        query.setBoolean(2, vg.isIsdefault());
        query.setInteger(3, vg.getId());
        return (query.executeUpdate() > 0); 
	}

	public VoucherGroup get(int id) {
		String hql = "from VoucherGroup u where u.id=?";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);//此时使用的是hql语句  
        query.setInteger(0, id);
        return (VoucherGroup) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<VoucherGroup> getAll() {
		String hql="from VoucherGroup";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
