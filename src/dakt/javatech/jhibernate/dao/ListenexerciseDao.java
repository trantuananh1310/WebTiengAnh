	package dakt.javatech.jhibernate.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;




import dakt.javatech.jhibernate.entity.Listenexercise;
import dakt.javatech.jhibernate.entity.Readexercise;

@Component 
@Transactional
public class ListenexerciseDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Listenexercise> list()
	{
		String uri="http://localhost:8084/Service/getListListenexercise";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Listenexercise>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Listenexercise>>(){});
		List<Listenexercise> lstEmp = rateResponse.getBody();
		return lstEmp;
	}
	
	public List<Listenexercise> list(int first, int max)
	{
		String hql="FROM Listenexercise";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	public List<Listenexercise> getListByLevelId(String id, int first, int max)
	{
		String uri="http://localhost:8084/Service/getLstListenexerciseById/id="+id+"&first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Listenexercise>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Listenexercise>>(){});
		List<Listenexercise> lstEmp = rateResponse.getBody();
		return lstEmp;
	}
	public List<Listenexercise> getListByLevelId(String id)
	{
		String uri="http://localhost:8084/Service/getListListenexerciseByLevelId/levelId="+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Listenexercise>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Listenexercise>>(){});
		List<Listenexercise> lstEmp = rateResponse.getBody();
		return lstEmp;
		
	}
	public Listenexercise getById(int id)
	{
		String uri="http://localhost:8084/Service/getListListenexerciseById/id="+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Listenexercise> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Listenexercise>(){});
		Listenexercise lstEmp = rateResponse.getBody();
		return lstEmp;
	}
	public void add(Listenexercise sp) throws UnsupportedOperationException, IOException
	{
		String url="http://localhost:8084/Service/addListenexercise";
		RestTemplate restTemplate = new RestTemplate();
		Listenexercise emp = restTemplate.postForObject(url, sp, Listenexercise.class);
	
	}
	public void update(Listenexercise listenExercise)
	{
	    final String uri = "http://localhost:8084/Service/updateListenexercise";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, listenExercise);
	}
	public void delete(int id)
	{
	    String uri = "http://localhost:8084/Service/deleteListenexercise/"+id;
	    Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("id", id);
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.delete( uri,  params );
	}
	
	public List<Listenexercise> getId(String s, int id)
	{
		String hql="FROM Listenexercise WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Listenexercise>)query.list();
	}

}
