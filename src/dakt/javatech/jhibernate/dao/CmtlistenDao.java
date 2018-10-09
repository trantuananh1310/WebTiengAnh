package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dakt.javatech.jhibernate.entity.Cmtlisten;
import dakt.javatech.jhibernate.entity.Cmtlisten;

@Component 
@Transactional
public class CmtlistenDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Cmtlisten> list()
	{
		String hql="FROM Cmtlisten";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Cmtlisten> list(int first, int max)
	{
		String hql="FROM Cmtlisten";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Cmtlisten getById(int id)
	{
		return (Cmtlisten)sessionFactory.getCurrentSession().get(Cmtlisten.class, id);
	}
	public void add(Cmtlisten sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Cmtlisten sp=getById(id);
//		sp.setTen(ten);
//		sp.setInstock(instock);
//		sp.setVanchuyen(vanchuyen);
//		sp.setGiacu(giacu);
//		sp.setGiamoi(giamoi);
//		sp.setBaohanh(baohanh);
//		sp.setMoi(moi);
//		sp.setDacbiet(dacbiet);
//		sp.setAnh(anh);
//		sp.setNewsletter(newsletter);
//		sessionFactory.getCurrentSession().update(sp);
////		sessionFactory.getCurrentSession().getTransaction().commit();
//	}
	public void delete(int id)
	{
		Cmtlisten Cmtlisten=getById(id);
		sessionFactory.getCurrentSession().delete(Cmtlisten);
	}
	
	public List<Cmtlisten> getId(String s, int id)
	{
		String hql="FROM Cmtlisten WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Cmtlisten>)query.list();
	}

}
