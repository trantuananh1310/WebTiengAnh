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
import dakt.javatech.jhibernate.entity.ListenGuideline;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;
import dakt.javatech.jhibernate.entity.ListenGuideline;

@Component 
@Transactional
public class ListenguidelineDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<ListenGuideline> list()
	{
		String uri="http://localhost:8084/Service/getListListenguideline";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<ListenGuideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<ListenGuideline>>(){});
		List<ListenGuideline> lst = rateResponse.getBody();
		return lst;
	}
	
	public List<ListenGuideline> list(int first, int max)
	{
		String hql="FROM ListenGuideline";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public ListenGuideline getById(int id)
	{
		return (ListenGuideline)sessionFactory.getCurrentSession().get(ListenGuideline.class, id);
	}
	public void add(ListenGuideline sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}

	public void delete(int id)
	{
		ListenGuideline ListenGuideline=getById(id);
		sessionFactory.getCurrentSession().delete(ListenGuideline);
	}
	
	public List<ListenGuideline> getId(String s, int id)
	{
		String hql="FROM ListenGuideline WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<ListenGuideline>)query.list();
	}
	
	public List<ListenGuideline> getListByLevelId(String level){
		String uri="http://localhost:8084/Service/getListListenguidelineByLevelId/LevelId="+level;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<ListenGuideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<ListenGuideline>>(){});
		List<ListenGuideline> lst = rateResponse.getBody();
		return lst;
	}
	public  ListenGuideline getListenGuidelineById(String id)
	{
		String hql="From ListenGuideline  Where listenguidelineid = '"+id+"'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (ListenGuideline)query.list().get(0);
	}
	
	public List<ListenGuideline> getListByLevelId(String id, int first, int max)
	{
		String uri="http://localhost:8084/Service/getListPageListenguidelineByLevelId/LevelId="+id+"&first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<ListenGuideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<ListenGuideline>>(){});
		List<ListenGuideline> lst = rateResponse.getBody();
		return lst;
	}

}
