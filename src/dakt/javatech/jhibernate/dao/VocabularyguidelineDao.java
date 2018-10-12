package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dakt.javatech.jhibernate.entity.Vocabularyguideline;

@Component 
@Transactional
public class VocabularyguidelineDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Vocabularyguideline> list()
	{
		String hql="FROM Vocabularyguideline";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Vocabularyguideline> list(int first, int max)
	{
		String hql="FROM Vocabularyguideline";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Vocabularyguideline getById(int id)
	{
		return (Vocabularyguideline)sessionFactory.getCurrentSession().get(Vocabularyguideline.class, id);
	}
	public void add(Vocabularyguideline sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Vocabularyguideline sp=getById(id);
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
		Vocabularyguideline vocabularyguideline=getById(id);
		sessionFactory.getCurrentSession().delete(vocabularyguideline);
	}
	
	public List<Vocabularyguideline> getId(String s, int id)
	{
		String hql="FROM Vocabularyguideline WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Vocabularyguideline>)query.list();
	}
	
	public List<Vocabularyguideline> getListByLevelId(String level){
		String hql="FROM Vocabularyguideline WHERE levelid='"+ level +"'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Vocabularyguideline>)query.list();
	}

}
