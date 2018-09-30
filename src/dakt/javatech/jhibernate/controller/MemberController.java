package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.CategorymemberDao;
import dakt.javatech.jhibernate.dao.MemberDao;
import dakt.javatech.jhibernate.entity.Categorymember;
import dakt.javatech.jhibernate.entity.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberDao memDao;
	
	@Autowired
	CategorymemberDao cateDao;
	
	@RequestMapping(value="/listMember", method=RequestMethod.GET)
	public ModelAndView getAllMembers(ModelMap model)
	{
		List<Member> lstMem=memDao.list();
		List<Categorymember> lstCate=cateDao.list();
		ModelAndView modelView=new ModelAndView("memberlist");
		modelView.addObject("list",lstMem);
		modelView.addObject("listCom",lstCate);
		return modelView;
	}

}
