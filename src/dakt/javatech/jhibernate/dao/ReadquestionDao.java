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

import dakt.javatech.jhibernate.entity.Readquestion;

@Component 
@Transactional
public class ReadquestionDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Readquestion> list(){
		String uri="http://localhost:8084/Service/getListReadQuestion";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Readquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Readquestion>>(){});
		List<Readquestion> lstReadQues = rateResponse.getBody();
		return lstReadQues;
	}
	
	public List<Readquestion> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getList/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Readquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Readquestion>>(){});
		List<Readquestion> lstReadQuestion = rateResponse.getBody();
		return lstReadQuestion;
	}
	
	public Readquestion getById(int id)
	{
		String uri="http://localhost:8084/Service/getReadQuestionById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Readquestion> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Readquestion>(){});
		Readquestion readQues = rateResponse.getBody();
		return readQues;
	}
	
	public void add(Readquestion readQues)
	{
			String url="http://localhost:8084/TestWebService/addReadexercise";
			RestTemplate restTemplate = new RestTemplate();
			Readquestion readQuestion = restTemplate.postForObject(url, readQues, Readquestion.class);
	}
	
	public void update(Readquestion readquestion)
	{
	    final String uri = "http://localhost:8084/Service/updateReadQuestion";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, readquestion);
	}
	
	public void delete(int id)
	{
	    String uri = "http://localhost:8084/Service/deleteReadQuestion/"+id;
	    Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("id", id);
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.delete( uri,  params );
	}
	
//	public List<Readquestion> getId(String s, int id)
//	{
//		String hql="FROM Readquestion WHERE "+s + " = "+id+"";
//		Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		return (List<Readquestion>)query.list();
//	}
	
	public List<Readquestion> getListByReadExId(int readexeriseid){
		
		String uri="http://localhost:8084/Service/getListReadQuestionByExId/readexeriseid="+readexeriseid;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Readquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Readquestion>>(){});
		List<Readquestion> lstReadQuestion = rateResponse.getBody();
		return lstReadQuestion;
		
	}
	
	public List<Readquestion> getListPage(int first, int max, String readexeriseid)
	{
		
		String uri="http://localhost:8084/Service/getListReadQuestionPage/first="+first+"&max="+max+"&readexeriseid="+readexeriseid;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Readquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Readquestion>>(){});
		List<Readquestion> lstReadQuestion = rateResponse.getBody();
		return lstReadQuestion;
	}
	
}
