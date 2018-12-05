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
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readexercise;

@Component 
@Transactional
public class LevelDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Level> list()
	{
		String uri="http://localhost:8084/Service/getListLevel";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Level>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Level>>(){});
		List<Level> lst = rateResponse.getBody();
		return lst;
	}
	
	public List<Level> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getListLevel/first="+first+"&max="+max;
	RestTemplate restTemplate = new RestTemplate();
	ResponseEntity<List<Level>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																		new ParameterizedTypeReference<List<Level>>(){});
	List<Level> lstLevel = rateResponse.getBody();
	return lstLevel;
		
	}
	public Level getById(int id)
	{
		String uri="http://localhost:8084/Service/getLevel/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Level> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Level>(){});
		Level level = rateResponse.getBody();
		return level;
	}
	public void add(Level sp)
	{
		String url="http://localhost:8084/Service/addLevel";
		RestTemplate restTemplate = new RestTemplate();
		Level level = restTemplate.postForObject(url,sp , Level.class);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Level sp=getById(id);
//		sp.setTen(ten);
//		sp.setInstock(instock);
//		sp.setVanchuyen(vanchuyen);
//		sp.setGiacu(giacu);
//		sp.setGiamoi(giamoi);
//		sp.setBaohanh(baohanh);
//		sp.setMoi(moi);
//		sp.setDacbiet(dacbiet);
//		sp.setAnh(anh);
//		sp.setNewsletter(newsletter);
//		sessionFactory.getCurrentSession().update(sp);
////		sessionFactory.getCurrentSession().getTransaction().commit();
//	}
	public void delete(int id)
	{
		String uri = "http://localhost:8084/Service/deleteLevel/"+id;
	    Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("id", id);
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.delete( uri,  params );
	}
	public void update(Level level )
	{
		 final String uri = "http://localhost:8084/Service/updateLevel";
	     
		    RestTemplate restTemplate = new RestTemplate();
		    restTemplate.put(uri, level);
	}
	
	

}
