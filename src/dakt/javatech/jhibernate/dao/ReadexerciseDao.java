package dakt.javatech.jhibernate.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
//	public List<Readexercise> list()
//	{
//		String hql="FROM Readexercise";
//		Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		return query.list();
//	}
	
	public List<Readexercise> list(){
		String uri="http://localhost:8084/Service/getAllReadExercise";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Readexercise>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Readexercise>>(){});
		List<Readexercise> lstReadEx = rateResponse.getBody();
		return lstReadEx;
	}
	
//	public List<Readexercise> list(int first, int max)
//	{
//		String hql="FROM Readexercise";
//		Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		query.setFirstResult(first);
//		query.setMaxResults(max);
//		return query.list();
//	}
	
	public List<Readexercise> list(int first, int max){
		String uri="http://localhost:8084/Service/getListReadexercise/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Readexercise>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Readexercise>>(){});
		List<Readexercise> lstReadEx = rateResponse.getBody();
		return lstReadEx;
	}
	
	public Readexercise getById(int id)
	{
		String uri="http://localhost:8084/Service/getReadexerciseById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Readexercise> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Readexercise>(){});
		Readexercise readexercise = rateResponse.getBody();
		return readexercise;
	}
	
	public void add(Readexercise readexercise)
	{
			String url="http://localhost:8084/Service/addReadexercise";
			RestTemplate restTemplate = new RestTemplate();
			Readexercise readex = restTemplate.postForObject(url, readexercise, Readexercise.class);
	}
	
	public void update(Readexercise readexercise)
	{
	    final String uri = "http://localhost:8084/Service/updateReadexercise";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, readexercise);
	}
	
	public void delete(int id)
	{
	    String uri = "http://localhost:8084/Service/deleteReadexercise/"+id;
	    Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("id", id);
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.delete( uri,  params );
	}
	
	
//	public List<Readexercise> getId(String s, int id)
//	{
//		String hql="FROM Readexercise WHERE "+s + " = "+id+"";
//		Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		return (List<Readexercise>)query.list();
//	}
	
	public List<Readexercise> getListByLevelId(String level){
		String uri="http://localhost:8084/Service/getListReadExerciseByLevelId/levelId="+level;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Readexercise>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Readexercise>>(){});
		List<Readexercise> lstReadEx = rateResponse.getBody();
		return lstReadEx;
	}
	
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
