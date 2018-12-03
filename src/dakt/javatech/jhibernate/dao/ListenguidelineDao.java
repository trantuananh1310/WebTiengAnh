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
		String uri="http://localhost:8084/Service/getListListenGuideline/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<ListenGuideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<ListenGuideline>>(){});
		List<ListenGuideline> lstListen = rateResponse.getBody();
		return lstListen;
	}
	public ListenGuideline getById(int id)
	{
		String uri="http://localhost:8084/Service/getListenGuidelineById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<ListenGuideline> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<ListenGuideline>(){});
		ListenGuideline listenguideline = rateResponse.getBody();
		return listenguideline;
	}
	public void add(ListenGuideline sp)
	{
		String url="http://localhost:8084/Service/addListenGuideline";
		RestTemplate restTemplate = new RestTemplate();
		ListenGuideline vocabgui = restTemplate.postForObject(url, sp, ListenGuideline.class);
	}
	
	public void update(ListenGuideline listenguideline)
	{
	    final String uri = "http://localhost:8084/Service/updateListenGuideline";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, listenguideline);
	}

	public void delete(int id)
	{
		String uri = "http://localhost:8084/Service/deleteListenGuideline/"+id;
	    Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("id", id);
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.delete( uri,  params );
	}
	
//	public List<ListenGuideline> getId(String s, int id)
//	{
//		String hql="FROM ListenGuideline WHERE "+s + " = "+id+"";
//		Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		return (List<ListenGuideline>)query.list();
//	}
	
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
		String uri="http://localhost:8084/Service/getListenGuidelineById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<ListenGuideline> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<ListenGuideline>(){});
		ListenGuideline listenguideline = rateResponse.getBody();
		return listenguideline;
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
