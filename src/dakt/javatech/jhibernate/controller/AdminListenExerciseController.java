package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ListenexerciseDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Listenexercise;

@Controller
public class AdminListenExerciseController {
	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ListenexerciseDao listenExDao;
	@RequestMapping(value="/AdminListenExercise", method=RequestMethod.GET)
	public ModelAndView AdminListenExercise(String levelId)
	{
		List<Listenexercise> list= new ArrayList<Listenexercise>();
		list= listenExDao.getListByLevelId(levelId);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView= new ModelAndView("admin/ListenExercise/List_ListenExercise");
		modelView.addObject("listListenExer",list);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
		
}
