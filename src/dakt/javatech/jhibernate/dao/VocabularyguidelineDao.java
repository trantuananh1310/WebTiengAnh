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

import dakt.javatech.jhibernate.entity.ListenGuideline;
import dakt.javatech.jhibernate.entity.Listenexercise;
import dakt.javatech.jhibernate.entity.Readexercise;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;

@Component 
@Transactional
public class VocabularyguidelineDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Vocabularyguideline> list()
	{
		String uri="http://localhost:8084/Service/getAllListVocabularyguideline";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Vocabularyguideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Vocabularyguideline>>(){});
		List<Vocabularyguideline> lst = rateResponse.getBody();
		return lst;
	}
	
	public List<Vocabularyguideline> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getListVocabularyguideline/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Vocabularyguideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Vocabularyguideline>>(){});
		List<Vocabularyguideline> lstVocabGui = rateResponse.getBody();
		return lstVocabGui;
	}
	public Vocabularyguideline getById(int id)
	{
		String uri="http://localhost:8084/Service/getVocabularyguidelineById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Vocabularyguideline> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Vocabularyguideline>(){});
		Vocabularyguideline vocabularyguideline = rateResponse.getBody();
		return vocabularyguideline;
	}
	public void add(Vocabularyguideline sp)
	{
		String url="http://localhost:8084/Service/addVocabularyguideline";
		RestTemplate restTemplate = new RestTemplate();
		Vocabularyguideline vocabgui = restTemplate.postForObject(url, sp, Vocabularyguideline.class);
	}
	public void update(Vocabularyguideline vocabularyguideline)
	{
	    final String uri = "http://localhost:8084/Service/updateVocabularyguideline";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, vocabularyguideline);
	}
	public void delete(int id)
	{
		 	String uri = "http://localhost:8084/Service/deleteVocabularyguideline/"+id;
		    Map<String, Integer> params = new HashMap<String, Integer>();
		    params.put("id", id);
		     
		    RestTemplate restTemplate = new RestTemplate();
		    restTemplate.delete( uri,  params );
	}
	
//	public List<Vocabularyguideline> getId(String s, int id)
//	{
//		String hql="FROM Vocabularyguideline WHERE "+s + " = "+id+"";
//		Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		return (List<Vocabularyguideline>)query.list();
//	}
	
	public List<Vocabularyguideline> getListByLevelId(String level){
		String uri="http://localhost:8084/Service/getListVocabularyguidelineByLevel/levelId="+level;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Vocabularyguideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Vocabularyguideline>>(){});
		List<Vocabularyguideline> lstByLevel = rateResponse.getBody();
		return lstByLevel;
	}
	
	public List<Vocabularyguideline> getListByLevelId(String id, int first, int max)
	{
		String uri="http://localhost:8084/Service/getListListVocabularyguidelineByLevelId/LevelId="+id+"&first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Vocabularyguideline>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Vocabularyguideline>>(){});
		List<Vocabularyguideline> lst = rateResponse.getBody();
		return lst;
	}
	
	

}
