package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dakt.javatech.jhibernate.entity.Cmtgrammar;

@Component 
@Transactional
public class CmtgrammarDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Cmtgrammar> list()
	{
		String hql="FROM Cmtgrammar";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Cmtgrammar> list(int first, int max)
	{
		String hql="FROM Cmtgrammar";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Cmtgrammar getById(int id)
	{
		return (Cmtgrammar)sessionFactory.getCurrentSession().get(Cmtgrammar.class, id);
	}
	public void add(Cmtgrammar sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Cmtgrammar sp=getById(id);
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
		Cmtgrammar cmtgrammar=getById(id);
		sessionFactory.getCurrentSession().delete(cmtgrammar);
	}
	
	public List<Cmtgrammar> getId(String s, int id)
	{
		String hql="FROM Cmtgrammar WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Cmtgrammar>)query.list();
	}

}
