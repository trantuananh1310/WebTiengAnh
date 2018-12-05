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
import dakt.javatech.jhibernate.entity.Member;

@Component 
@Transactional
public class MemberDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Member> list()
	{
		String uri="http://localhost:8084/Service/getListMember";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Member>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Member>>(){});
		List<Member> lst = rateResponse.getBody();
		return lst;
	}
	
	public List<Member> list(int first, int max)
	{
		String uri="http://localhost:8084/Service/getListMember/first="+first+"&max="+max;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Member>> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<List<Member>>(){});
		List<Member> lstLevel = rateResponse.getBody();
		return lstLevel;
	}
	public Member getById(int id)
	{
		String uri="http://localhost:8084/Service/getMember/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Member> rateResponse = restTemplate.exchange(uri, HttpMethod.GET, null, 
																			new ParameterizedTypeReference<Member>(){});
		Member member = rateResponse.getBody();
		return member;
	}
	public void add(Member mem)
	{
		String url="http://localhost:8084/Service/addMember";
		RestTemplate restTemplate = new RestTemplate();
		Member member = restTemplate.postForObject(url,mem , Member.class);
	}
	public void update(Member member)
	{
		final String uri = "http://localhost:8084/Service/updateMember";
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.put(uri, member);
	}
	public void delete(int id)
	{
		String uri = "http://localhost:8084/Service/deleteMember/"+id;
	    Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("id", id);
	     
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.delete( uri,  params );
	}

}
