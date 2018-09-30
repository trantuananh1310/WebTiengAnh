package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dakt.javatech.jhibernate.entity.Member;

@Component 
@Transactional
public class MemberDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Member> list()
	{
		String hql="FROM Member";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Member> list(int first, int max)
	{
		String hql="FROM Member";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Member getById(int id)
	{
		return (Member)sessionFactory.getCurrentSession().get(Member.class, id);
	}
	public void add(Member mem)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(mem);
	}
//	public void update(Member member)
//	{
//		Member mem=getById(member.getMemberid());
//		sessionFactory.getCurrentSession().update(mem);
//	}
	public void delete(int id)
	{
		Member mem=getById(id);
		sessionFactory.getCurrentSession().delete(mem);
	}

}
