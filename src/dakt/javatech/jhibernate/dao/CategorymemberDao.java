package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dakt.javatech.jhibernate.entity.Categorymember;

@Component 
@Transactional
public class CategorymemberDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Categorymember> list()
	{
		String hql="FROM Categorymember";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Categorymember> list(int first, int max)
	{
		String hql="FROM Categorymember";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Categorymember getById(int id)
	{
		return (Categorymember)sessionFactory.getCurrentSession().get(Categorymember.class, id);
	}
	public void add(Categorymember cate)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(cate);
	}
//	public void update(int id, String email, String name)
//	{
//		Categorymember cate=getById(id);
//		sessionFactory.getCurrentSession().update(cate);
//	}
	public void delete(int id)
	{
		Categorymember cate=getById(id);
		sessionFactory.getCurrentSession().delete(cate);
	}

}
