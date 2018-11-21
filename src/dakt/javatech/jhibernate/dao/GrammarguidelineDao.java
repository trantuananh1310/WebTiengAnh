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

import dakt.javatech.jhibernate.entity.Grammarguideline;
import dakt.javatech.jhibernate.entity.Listenquestion;

@Component 
@Transactional
public class GrammarguidelineDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Grammarguideline> list()
	{
		String uri="http://localhost:8084/Service/getListGrammarguideline";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Grammarguideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Grammarguideline>>(){});
		List<Grammarguideline> lst = rateResponse.getBody();
		return lst;
	}
	public List<Grammarguideline> list(int first, int max)
	{
		String hql="FROM Grammarguideline";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public Grammarguideline getById(int id)
	{
		return (Grammarguideline)sessionFactory.getCurrentSession().get(Grammarguideline.class, id);
	}
	public void add(Grammarguideline sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Grammarguideline sp=getById(id);
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
		Grammarguideline grammarguideline=getById(id);
		sessionFactory.getCurrentSession().delete(grammarguideline);
	}
	public List<Grammarguideline> getId(String s, int id)
	{
		String hql="FROM Grammarguideline WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Grammarguideline>)query.list();
	}
	public List<Grammarguideline> getListByLevelId(String LevelId){
		String uri="http://localhost:8084/Service/getListGrammarguidelineByLevelId/LevelId="+LevelId;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Grammarguideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Grammarguideline>>(){});
		List<Grammarguideline> lst = rateResponse.getBody();
		return lst;
	}
	public List<Grammarguideline> getListByLevelIdPhanTrang(String LevelId, int first, int max)
	{
		String uri="http://localhost:8084/Service/getListGrammarguidelineByLevelIdPhanTrang/LevelId="+LevelId+"&first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Grammarguideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Grammarguideline>>(){});
		List<Grammarguideline> lst = rateResponse.getBody();
		return lst;
	}

}
