package dakt.javatech.jhibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import dakt.javatech.jhibernate.entity.Listenexercise;
import dakt.javatech.jhibernate.entity.Listenquestion;
import dakt.javatech.jhibernate.entity.Readquestion;

@Component 
@Transactional
public class ListenquestionDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Listenquestion> list()
	{
		String uri="http://localhost:8084/Service/getListListenquestion";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Listenquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Listenquestion>>(){});
		List<Listenquestion> lst = rateResponse.getBody();
		return lst;
	}
	
	public List<Listenquestion> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getListListenquestion/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Listenquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Listenquestion>>(){});
		List<Listenquestion> lst = rateResponse.getBody();
		return lst;
	}
	public Listenquestion getById(int id)
	{

		String uri="http://localhost:8084/Service/getListListenquestion/id="+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Listenquestion> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Listenquestion>(){});
		Listenquestion item = rateResponse.getBody();
		return item;
	}
	public void add(Listenquestion sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Listenquestion sp=getById(id);
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
		Listenquestion listenquestion=getById(id);
		sessionFactory.getCurrentSession().delete(listenquestion);
	}
	
	public List<Listenquestion> getId(String s, int id)
	{
		String hql="FROM Listenquestion WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Listenquestion>)query.list();
	}

	public List<Listenquestion> getListByListenExerciseId(String listenExerciseId,int first, int max) {
		String uri="http://localhost:8084/Service/getListByListenExerciseId/ListenExerciseId="+listenExerciseId+"&first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Listenquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Listenquestion>>(){});
		List<Listenquestion> lst = rateResponse.getBody();
		return lst;
	}
	public List<Listenquestion> getListByListenExerciseId(int listenExerciseId) {
		String uri="http://localhost:8084/Service/getListByListenExerciseId1/ListenExerciseId="+listenExerciseId;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Listenquestion>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Listenquestion>>(){});
		List<Listenquestion> lst = rateResponse.getBody();
		return lst;
	}

}
