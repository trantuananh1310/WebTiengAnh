package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.ListenguidelineDao;
import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.entity.ListenGuideline;
import dakt.javatech.jhibernate.entity.Level;

@Controller
public class ListenguidelineController {

	@Autowired
	ListenguidelineDao listenDao;
	
	@Autowired
	LevelDao levelDao;
	
	@RequestMapping(value="/listListenguideline", method=RequestMethod.GET)
	public ModelAndView getAllMembers(String level)
	{
		List<ListenGuideline> lstListen=listenDao.getListByLevelId(level);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("list_listen_guideline");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstListen", lstListen);
		return modelView;
	}
	
	@RequestMapping(value="/contentlisten", method=RequestMethod.GET)
	public ModelAndView getAllMembers()
	{
		
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("content_listen");
		modelView.addObject("lstLevel", lstLevel);
		return modelView;
	}
}
