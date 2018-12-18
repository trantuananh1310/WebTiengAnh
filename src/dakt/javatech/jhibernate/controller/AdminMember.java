package dakt.javatech.jhibernate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.CategorymemberDao;
import dakt.javatech.jhibernate.dao.MemberDao;
import dakt.javatech.jhibernate.entity.Categorymember;
import dakt.javatech.jhibernate.entity.Member;

@Controller
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
	public  String addMember(Member member,ModelMap modelMap,HttpServletRequest request)
	{
		List<Member> list= memberDao.list();
		for (Member item : list) {
			if(item.getMembername()==member.getMembername())
				return("Error");
		}
		if(!member.getEmail().isEmpty())
		memberDao.add(member);
		return "success";
	}

}
