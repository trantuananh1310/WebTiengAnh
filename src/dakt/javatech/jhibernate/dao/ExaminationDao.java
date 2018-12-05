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

import dakt.javatech.jhibernate.entity.Examination;

@Component 
@Transactional
public class ExaminationDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Examination> list()
	{
			String uri="http://localhost:8084/Service/getAllListExamination";
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<List<Examination>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																				new ParameterizedTypeReference<List<Examination>>(){});
			List<Examination> lst = rateResponse.getBody();
			return lst;
		
	}
	
	public List<Examination> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getListExamination/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Examination>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Examination>>(){});
		List<Examination> lstExam = rateResponse.getBody();
		return lstExam;
	}
	
	public Examination getById(int id)
	{
		String uri="http://localhost:8084/Service/getExaminationById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Examination> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Examination>(){});
		Examination examination = rateResponse.getBody();
		return examination;
	}
	public void add(Examination exam)
	{
		String url="http://localhost:8084/Service/addExamination";
		RestTemplate restTemplate = new RestTemplate();
		Examination examination = restTemplate.postForObject(url, exam, Examination.class);
	}
	public void update(Examination exam)
	{
	    final String uri = "http://localhost:8084/Service/updateExamination";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, exam);
	}
	public void delete(int id)
	{
		 	String uri = "http://localhost:8084/Service/deleteExamination/"+id;
		    Map<String, Integer> params = new HashMap<String, Integer>();
		    params.put("id", id);
		     
		    RestTemplate restTemplate = new RestTemplate();
		    restTemplate.delete( uri,  params );
	}

}
