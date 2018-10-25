package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dakt.javatech.jhibernate.entity.Listenexercise;

@Component 
@Transactional
public class ListenexerciseDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Listenexercise> list()
	{
		String hql="FROM Listenexercise";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Listenexercise> list(int first, int max)
	{
		String hql="FROM Listenexercise";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public List<Listenexercise> getListByLevelId(String id, int first, int max)
	{
		String hql="From Listenexercise  where levelid ='"+id+"'"; 
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public List<Listenexercise> getListByLevelId(String id)
	{
		String hql="From Listenexercise  where levelid ='"+id+"'"; 
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	public Listenexercise getById(int id)
	{
		return (Listenexercise)sessionFactory.getCurrentSession().get(Listenexercise.class, id);
	}
	public void add(Listenexercise sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Listenexercise sp=getById(id);
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
		Listenexercise listenexercise=getById(id);
		sessionFactory.getCurrentSession().delete(listenexercise);
	}
	
	public List<Listenexercise> getId(String s, int id)
	{
		String hql="FROM Listenexercise WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Listenexercise>)query.list();
	}

}
