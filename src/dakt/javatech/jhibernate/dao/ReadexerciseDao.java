package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import dakt.javatech.jhibernate.entity.Readexercise;

@Component 
@Transactional
public class ReadexerciseDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Readexercise> list()
	{
		String hql="FROM Readexercise";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Readexercise> list(int first, int max)
	{
		String hql="FROM Readexercise";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Readexercise getById(int id)
	{
		return (Readexercise)sessionFactory.getCurrentSession().get(Readexercise.class, id);
	}
	public void add(Readexercise sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Readexercise sp=getById(id);
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
		Readexercise readexercise=getById(id);
		sessionFactory.getCurrentSession().delete(readexercise);
	}
	
	public List<Readexercise> getId(String s, int id)
	{
		String hql="FROM Readexercise WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Readexercise>)query.list();
	}
	
//	public List<Readexercise> getListByLevelId(String level){
//		String hql="FROM Readexercise WHERE levelid='"+ level +"'";
//		Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		return (List<Readexercise>)query.list();
//	}
	
	public List<Readexercise> getListByLevelId(String level){
		String uri="http://localhost:8084/Service//getListReadExerciseByLevelId/levelId="+level;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Readexercise>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Readexercise>>(){});
		List<Readexercise> lstReadEx = rateResponse.getBody();
		return lstReadEx;
	}
	
//	public List<Readexercise> getListByLevelIdPage(String level, int first, int max)
//	{
//		String hql="From Readexercise  where levelid ='"+level+"'"; 
//		Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		query.setFirstResult(first);
//		query.setMaxResults(max);
//		return query.list();
//	}
	
	public List<Readexercise> getListByLevelIdPage(String level, int first, int max)
	{
		
		String uri="http://localhost:8084/Service/getListByLevelIdPage/level="+level+"&first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Readexercise>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Readexercise>>(){});
		List<Readexercise> lstReadEx = rateResponse.getBody();
		return lstReadEx;
	}

}
