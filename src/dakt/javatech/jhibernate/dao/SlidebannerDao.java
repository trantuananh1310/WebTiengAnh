package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dakt.javatech.jhibernate.entity.Slidebanner;

@Component 
@Transactional
public class SlidebannerDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Slidebanner> list()
	{
		String hql="FROM Slidebanner";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Slidebanner> list(int first, int max)
	{
		String hql="FROM Slidebanner";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Slidebanner getById(int id)
	{
		return (Slidebanner)sessionFactory.getCurrentSession().get(Slidebanner.class, id);
	}
	public void add(Slidebanner sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Slidebanner sp=getById(id);
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
		Slidebanner slidebanner=getById(id);
		sessionFactory.getCurrentSession().delete(slidebanner);
	}
	
	public List<Slidebanner> getId(String s, int id)
	{
		String hql="FROM Slidebanner WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Slidebanner>)query.list();
	}

}
