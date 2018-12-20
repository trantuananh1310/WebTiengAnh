package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import dakt.javatech.jhibernate.dao.CategorymemberDao;
import dakt.javatech.jhibernate.dao.MemberDao;
import dakt.javatech.jhibernate.entity.Categorymember;
import dakt.javatech.jhibernate.entity.Listenquestion;
import dakt.javatech.jhibernate.entity.Member;

@Controller
@EnableWebMvc
public class AdminMember {
	@Autowired MemberDao memberDao;
	@Autowired CategorymemberDao categoryMemberDao;
	@RequestMapping(value="/AdminMember", method=RequestMethod.GET)
	public ModelAndView ListMember()
	{
		List<Member> listMember= memberDao.list();
		List<Categorymember> listCategorymember=categoryMemberDao.list();
		ModelAndView modelView= new ModelAndView("/admin/member/list_member");
		modelView.addObject("listMember", listMember);
		modelView.addObject("listCategory", listCategorymember);
		return modelView;
		
	}
	@RequestMapping(value="/addMember",method=RequestMethod.POST)
	@ResponseBody
	public  String addMember(String membername, String memberpass, String name, 
			 String email, String sdt,String categorymemberid,String memberid, HttpServletRequest request)
	{
		List<Member> list= memberDao.list();
		for (Member item : list) {
			if(item.getMembername().equals(membername))
				return("ErrorMember");
		}
		try {
			Integer.parseInt(sdt);
			
		} catch (Exception e) {
			return "ErrorPhone";
		}
		Member member = new Member();
		member.setName(name);
		member.setMembername(membername);
		member.setMemberpass(memberpass);
		member.setEmail(email);
		member.setSdt(Integer.parseInt(sdt));
		member.setCategorymemberid(Integer.parseInt(categorymemberid));
		memberDao.add(member);
		return "success";
	}
	@RequestMapping(value="/deleteMember",method=RequestMethod.POST)
	public void deleteMember(Integer memberId)	
	{
		memberDao.delete(memberId);
	}
}
