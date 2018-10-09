package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.entity.Level;

@Controller
public class HomeController {

	@Autowired
	LevelDao levelDao;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView getAllMembers(ModelMap model)
	{
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("home");
		modelView.addObject("lstLevel", lstLevel);
		return modelView;
	}
}
