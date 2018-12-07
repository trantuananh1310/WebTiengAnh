package dakt.javatech.jhibernate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.CategorymemberDao;
import dakt.javatech.jhibernate.dao.MemberDao;
import dakt.javatech.jhibernate.entity.Categorymember;
import dakt.javatech.jhibernate.entity.Member;

@Controller
public class LoginController {
	
	public static final String LOGIN_USER_SUCCESS = "USER";
	public static final String LOGIN_ADMIN_SUCCESS = "ADMIN";
	public static final String LOGIN_FAIL= "FAIL";
	public static final String ERR_REGISTER_PASS= "ErrConfirmPass";
	public static final String ERR_REGISTER_USERNAME= "ErrUserName";
	public static final String ERR_REGISTER_PHONE= "ErrPhone";
	public static final String REGISTER_SUCCESS= "Success";
	
	@Autowired
	MemberDao memDao;
	
	@Autowired
	CategorymemberDao cateDao;
	
	@RequestMapping(value="/loginAction", method=RequestMethod.POST)
	@ResponseBody
	public String loginAction(HttpServletRequest request,HttpSession session,ModelMap model, String username, String password)
	{
		
		List<Member> mem=memDao.list();
		for(int i=0;i<mem.size();i++)
		{
			if(username.equals(mem.get(i).getMembername())&& password.equals(mem.get(i).getMemberpass()))
			{
				if(mem.get(i).getCategorymemberid()==1)
				{
					session.setAttribute("sessionuser", mem.get(i).getName());
					return LOGIN_USER_SUCCESS;
				}
				session.setAttribute("sessionadmin", mem.get(i).getName());
				return LOGIN_ADMIN_SUCCESS;
			}
		}
		return LOGIN_FAIL;
	}
	
	@RequestMapping(value="/logoutAction", method=RequestMethod.GET)
	public ModelAndView Logout(HttpSession session)
	{
		session.removeAttribute("sessionuser");
		session.removeAttribute("sessionadmin");
		ModelAndView modelView=new ModelAndView("redirect:/home");
		return modelView;
	}
	
	@RequestMapping(value="/homeAdmin", method=RequestMethod.GET)
	public ModelAndView homeAdmin(ModelMap model)
	{
		ModelAndView modelView=new ModelAndView("admin/index");
		return modelView;
	}
	
	@RequestMapping(value="/registerAction", method=RequestMethod.POST)
	@ResponseBody
	public String RegisterAction(String fullname, String username, String password, 
			String confirmpass, String email, String phone, HttpServletRequest request,HttpSession session)
	{
		if(!password.equals(confirmpass)){
			return ERR_REGISTER_PASS;
		}
		
		try {
			Integer.parseInt(phone);
			if(Integer.parseInt(phone)<0){
				return ERR_REGISTER_PHONE;
			}
		} catch (Exception e) {
			return ERR_REGISTER_PHONE;
		}
		
		List<Member> lsmem=memDao.list();
		for(int i=0;i<lsmem.size();i++)
		{
			if(username.equals(lsmem.get(i).getMembername()))
			{
				return ERR_REGISTER_USERNAME;
			}
		}
		Member mem= new Member();
		mem.setName(fullname);
		mem.setMembername(username);
		mem.setMemberpass(password);
		mem.setEmail(email);
		mem.setSdt(Integer.parseInt(phone));
		mem.setCategorymemberid(1);;
		memDao.add(mem);
		session.setAttribute("sessionuser", fullname);
		return REGISTER_SUCCESS;
	}
}
