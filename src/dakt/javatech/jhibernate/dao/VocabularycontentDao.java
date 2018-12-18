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
import dakt.javatech.jhibernate.entity.Readexercise;
import dakt.javatech.jhibernate.entity.Readquestion;
import dakt.javatech.jhibernate.entity.Vocabularycontent;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;

@Component 
@Transactional
public class VocabularycontentDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Vocabularycontent> list()
	{
		String uri="http://localhost:8084/Service/getListVocabularycontent";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Vocabularycontent>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Vocabularycontent>>(){});
		List<Vocabularycontent> lst = rateResponse.getBody();
		return lst;
	}
	
	public List<Vocabularycontent> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getListVocabularycontent/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Vocabularycontent>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Vocabularycontent>>(){});
		List<Vocabularycontent> lstVocabCon = rateResponse.getBody();
		return lstVocabCon;
	}
	public Vocabularycontent getById(int id)
	{
		String uri="http://localhost:8084/Service/getVocabularycontentById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Vocabularycontent> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Vocabularycontent>(){});
		Vocabularycontent vocabularycontent = rateResponse.getBody();
		return vocabularycontent;
	}
	public void add(Vocabularycontent sp)
	{
		String url="http://localhost:8084/Service/addVocabularycontent";
		RestTemplate restTemplate = new RestTemplate();
		Vocabularycontent vocabcon = restTemplate.postForObject(url, sp, Vocabularycontent.class);
	}

	public void delete(int id)
	{
		String uri = "http://localhost:8084/Service/deleteVocabularycontent/"+id;
	    Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("id", id);
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.delete( uri,  params );
	}
	
	public void update(Vocabularycontent vocabularycontent)
	{
	    final String uri = "http://localhost:8084/Service/updateVocabularycontent";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, vocabularycontent);
	}
	
//	public List<Vocabularycontent> getId(String s, int id)
//	{
//		String hql="FROM Vocabularycontent WHERE "+s + " = "+id+"";
//		Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		return (List<Vocabularycontent>)query.list();
//	}
	public List<Vocabularycontent> getListByLevelId(int vocabid){
		String uri="http://localhost:8084/Service/getListListVocabularycontentByLevelId/LevelId="+vocabid;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Vocabularycontent>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Vocabularycontent>>(){});
		List<Vocabularycontent> lst = rateResponse.getBody();
		return lst;
	}
	
	public List<Vocabularycontent> getListPage(int first, int max, String vocabid)
	{
		String uri="http://localhost:8084/Service/getListPageVocabularycontentByLevelId/LevelId="+vocabid+"&first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Vocabularycontent>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Vocabularycontent>>(){});
		List<Vocabularycontent> lst = rateResponse.getBody();
		return lst;
	}



}
