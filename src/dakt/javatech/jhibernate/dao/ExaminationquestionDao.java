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

import dakt.javatech.jhibernate.entity.Categorymember;
import dakt.javatech.jhibernate.entity.Examinationquestion;

@Component 
@Transactional
public class ExaminationquestionDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Examinationquestion> list()
	{
			String uri="http://localhost:8084/Service/getAllListExaminationquestion";
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<List<Examinationquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																				new ParameterizedTypeReference<List<Examinationquestion>>(){});
			List<Examinationquestion> lst = rateResponse.getBody();
			return lst;
		
	}
	
	public List<Examinationquestion> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getListExaminationquestion/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Examinationquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Examinationquestion>>(){});
		List<Examinationquestion> lstExam = rateResponse.getBody();
		return lstExam;
	}
	
	public Examinationquestion getById(int id)
	{
		String uri="http://localhost:8084/Service/getExaminationquestionById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Examinationquestion> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Examinationquestion>(){});
		Examinationquestion examinationquestion = rateResponse.getBody();
		return examinationquestion;
	}
	public void add(Examinationquestion examques)
	{
		String url="http://localhost:8084/Service/addExaminationquestion";
		RestTemplate restTemplate = new RestTemplate();
		Examinationquestion examinationquestion = restTemplate.postForObject(url, examques, Examinationquestion.class);
	}
	public void update(Examinationquestion examques)
	{
	    final String uri = "http://localhost:8084/Service/updateExaminationquestion";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, examques);
	}
	public void delete(int id)
	{
		 	String uri = "http://localhost:8084/Service/deleteExaminationquestion/"+id;
		    Map<String, Integer> params = new HashMap<String, Integer>();
		    params.put("id", id);
		     
		    RestTemplate restTemplate = new RestTemplate();
		    restTemplate.delete( uri,  params );
	}

}
