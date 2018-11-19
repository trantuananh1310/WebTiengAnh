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

import dakt.javatech.jhibernate.entity.Readquestion;

@Component 
@Transactional
public class ReadquestionDao {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Readquestion> list()
	{
		String hql="FROM Readquestion";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
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
		return (Readquestion)sessionFactory.getCurrentSession().get(Readquestion.class, id);
	}
	public void add(Readquestion sp)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
	}
//	public void update(int id, String ten, int instock, String vanchuyen, Double giacu, Double giamoi, String baohanh, int moi, int dacbiet,String anh, String newsletter)
//	{
////		sessionFactory.getCurrentSession().beginTransaction();
//		Readquestion sp=getById(id);
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
		Readquestion readquestion=getById(id);
		sessionFactory.getCurrentSession().delete(readquestion);
	}
	
	public List<Readquestion> getId(String s, int id)
	{
		String hql="FROM Readquestion WHERE "+s + " = "+id+"";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return (List<Readquestion>)query.list();
	}
	
	public List<Readquestion> getListByLevelId(String readexeriseid){
		
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
