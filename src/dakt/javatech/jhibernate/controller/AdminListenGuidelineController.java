package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ListenguidelineDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.ListenGuideline;
import dakt.javatech.jhibernate.entity.Listenexercise;

@Controller
public class AdminListenGuidelineController {
	
	
	@Autowired 
	LevelDao levelDao;
	
	@Autowired
	ListenguidelineDao lisGuidao;
	
	@RequestMapping(value="/AdminListenGuideline", method=RequestMethod.GET)
	public ModelAndView AdminListenGuideline()
	{
		List<ListenGuideline> list= new ArrayList<ListenGuideline>();
		list= lisGuidao.list();
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView= new ModelAndView("admin/Vocab_Listen_Guideline/list_listenGuidelineAdmin");
		modelView.addObject("listAdListenGui",list);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
	
	@RequestMapping(value="/getListListenByLevelIdAjax",method=RequestMethod.GET)
	public ModelAndView getListListenByLevelIdAjax(String levelId)
	{
		List<ListenGuideline> list= new ArrayList<ListenGuideline>();
		if(levelId.equals("0")) list=lisGuidao.list();
		else
			list= lisGuidao.getListByLevelId(levelId);
		ModelAndView modelView= new ModelAndView("admin/Vocab_Listen_Guideline/list_listen_byLevelIdAdmin");
		modelView.addObject("listAdListenGui",list);
		return modelView;

	}
	
	@RequestMapping(value="/addListenGuideline",method=RequestMethod.POST)
	public ModelAndView addListenGuideline(String listenGuidelineName, String levelId )	
	{
		Level level = levelDao.getById(Integer.parseInt(levelId));
		ListenGuideline item= new ListenGuideline();
		item.setListenname(listenGuidelineName);
		item.setLevelid(Integer.parseInt(levelId));
		item.setListenimage("abc");
		lisGuidao.add(item);
		return new ModelAndView("redirect:/AdminListenGuideline");
	}
	
	
	@RequestMapping(value="/AdminListenGuidelineContent", method=RequestMethod.GET)
	public ModelAndView getContentById(String id)
	{
		
		List<Level> lstLevel=levelDao.list();
		ListenGuideline  content= lisGuidao.getListenGuidelineById(id);
		ModelAndView modelView=new ModelAndView("admin/Vocab_Listen_Guideline/list_listenGuidelineContentAdmin");
		modelView.addObject("listLevel", lstLevel);
		modelView.addObject("Content", content);
		
		return modelView;
	}

}
