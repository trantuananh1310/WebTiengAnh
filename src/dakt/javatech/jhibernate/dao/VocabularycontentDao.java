package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dakt.javatech.jhibernate.entity.Vocabularycontent;

@Component 
@Transactional
public class VocabularycontentDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Vocabularycontent> list()
	{
		String hql="FROM Vocabularycontent";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Vocabularycontent> list(int first, int max)
	{
		String hql="FROM Vocabularycontent";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Vocabularycontent getById(int id)
	{
		return (Vocabularycontent)sessionFactory.getCurrentSession().get(Vocabularycontent.class, id);
	}
	public void add(Vocabularycontent sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Vocabularycontent sp=getById(id);
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
		Vocabularycontent vocabularycontent=getById(id);
		sessionFactory.getCurrentSession().delete(vocabularycontent);
	}
	
	public List<Vocabularycontent> getId(String s, int id)
	{
		String hql="FROM Vocabularycontent WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Vocabularycontent>)query.list();
	}

}
