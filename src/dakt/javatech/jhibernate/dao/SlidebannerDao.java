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

import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Slidebanner;

@Component 
@Transactional
public class SlidebannerDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Slidebanner> list()
	{
		String uri="http://localhost:8084/Service/getListSlidebanner";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Slidebanner>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Slidebanner>>(){});
		List<Slidebanner> lst = rateResponse.getBody();
		return lst;
	}
	
	public List<Slidebanner> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getListSlidebanner/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Slidebanner>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Slidebanner>>(){});
		List<Slidebanner> lstSlidebanner = rateResponse.getBody();
		return lstSlidebanner;
	}
	public Slidebanner getById(int id)
	{
		String uri="http://localhost:8084/Service/getSlidebanner/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Slidebanner> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Slidebanner>(){});
		Slidebanner slidebanner = rateResponse.getBody();
		return slidebanner;
	}
	public void add(Slidebanner sp)
	{
		String url="http://localhost:8084/Service/addSlidebanner";
		RestTemplate restTemplate = new RestTemplate();
		Slidebanner slidebanner = restTemplate.postForObject(url,sp , Slidebanner.class);
	}
	public void update(Slidebanner slidebanner )
	{
		 final String uri = "http://localhost:8084/Service/updateSlidebanner";
	     
		    RestTemplate restTemplate = new RestTemplate();
		    restTemplate.put(uri, slidebanner);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Slidebanner sp=getById(id);
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
		String uri = "http://localhost:8084/Service/deleteSlidebanner/"+id;
	    Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("id", id);
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.delete( uri,  params );
	}
	
	public List<Slidebanner> getId(String s, int id)
	{
		String hql="FROM Slidebanner WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Slidebanner>)query.list();
	}

}
