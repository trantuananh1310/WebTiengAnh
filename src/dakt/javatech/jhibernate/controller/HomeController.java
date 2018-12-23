package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.SlidebannerDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Slidebanner;

@Controller
public class HomeController {

	@Autowired
	LevelDao levelDao;
	
	@Autowired
	SlidebannerDao slideDao;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView Home(ModelMap model)
	{
		List<Level> lstLevel=levelDao.list();
		List<Slidebanner> lstSlide =slideDao.list();
		ModelAndView modelView=new ModelAndView("home");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("slideActive", lstSlide.get(0));
		lstSlide.remove(0);
		modelView.addObject("lstSlide", lstSlide);
		return modelView;
	}
	
	@RequestMapping(value="/AboutUs", method=RequestMethod.GET)
	public ModelAndView AboutUs(ModelMap model)
	{
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("include/about_us");
		modelView.addObject("lstLevel",lstLevel);
		return modelView;
	}
	
	@RequestMapping(value="/Contact", method=RequestMethod.GET)
	public ModelAndView Contact(ModelMap model)
	{
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("contact");
		modelView.addObject("lstLevel",lstLevel);
		return modelView;
	}
	
	
}
