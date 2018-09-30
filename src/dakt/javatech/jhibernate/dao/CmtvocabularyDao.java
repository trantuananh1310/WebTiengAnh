package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dakt.javatech.jhibernate.entity.Cmtvocabulary;

@Component 
@Transactional
public class CmtvocabularyDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Cmtvocabulary> list()
	{
		String hql="FROM Cmtvocabulary";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Cmtvocabulary> list(int first, int max)
	{
		String hql="FROM Cmtvocabulary";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Cmtvocabulary getById(int id)
	{
		return (Cmtvocabulary)sessionFactory.getCurrentSession().get(Cmtvocabulary.class, id);
	}
	public void add(Cmtvocabulary sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Cmtvocabulary sp=getById(id);
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
		Cmtvocabulary cmtvocab=getById(id);
		sessionFactory.getCurrentSession().delete(cmtvocab);
	}
	
	public List<Cmtvocabulary> getId(String s, int id)
	{
		String hql="FROM Cmtvocabulary WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Cmtvocabulary>)query.list();
	}

}
