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

@Component 
@Transactional
public class CategorymemberDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Categorymember> list()
	{
			String uri="http://localhost:8084/Service/getAllListCategorymember";
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<List<Categorymember>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																				new ParameterizedTypeReference<List<Categorymember>>(){});
			List<Categorymember> lst = rateResponse.getBody();
			return lst;
		
	}
	
	public List<Categorymember> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getListCategorymember/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Categorymember>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Categorymember>>(){});
		List<Categorymember> lstCateMem = rateResponse.getBody();
		return lstCateMem;
	}
	
	public Categorymember getById(int id)
	{
		String uri="http://localhost:8084/Service/getCategorymemberById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Categorymember> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Categorymember>(){});
		Categorymember vocabularyguideline = rateResponse.getBody();
		return vocabularyguideline;
	}
	public void add(Categorymember cate)
	{
		String url="http://localhost:8084/Service/addCategorymember";
		RestTemplate restTemplate = new RestTemplate();
		Categorymember categorymember = restTemplate.postForObject(url, cate, Categorymember.class);
	}
	public void update(Categorymember catemember)
	{
	    final String uri = "http://localhost:8084/Service/updateCategorymember";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, catemember);
	}
	public void delete(int id)
	{
		 	String uri = "http://localhost:8084/Service/deleteCategorymember/"+id;
		    Map<String, Integer> params = new HashMap<String, Integer>();
		    params.put("id", id);
		     
		    RestTemplate restTemplate = new RestTemplate();
		    restTemplate.delete( uri,  params );
	}

}
