package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ReadexerciseDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readexercise;

@Controller
public class AdminReadExerciseController {
	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ReadexerciseDao readExDao;
	
	@RequestMapping(value="/AdminReadExercise", method=RequestMethod.GET)
	public ModelAndView AdminReadExercise()
	{
		List<Readexercise> lstReadEx= new ArrayList<Readexercise>();
		lstReadEx = readExDao.list();
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView= new ModelAndView("admin/read_exercise/list_read_exercise");
		modelView.addObject("lstReadEx",lstReadEx);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
//	@RequestMapping(value="/getListExrciseByLevelIdAjax",method=RequestMethod.GET)
//	public ModelAndView getListExrciseByLevelIdAjax(String levelId)
//	{
//		List<Listenexercise> list= new ArrayList<Listenexercise>();
//		if(levelId.equals("0")) list=listenExDao.list();
//		else
//			list= listenExDao.getListByLevelId(levelId);
//		ModelAndView modelView= new ModelAndView("admin/ListenExercise/list_exercise_byLevelIdAdmin");
//		modelView.addObject("listListenExer",list);
//		return modelView;
//
//	}
//	@RequestMapping(value="/addListenExercise",method=RequestMethod.POST)
//	public ModelAndView addListenExercise(String listenExerciseName, String levelId )	
//	{
//		Listenexercise item= new Listenexercise();
//		item.setListenexercisename(listenExerciseName);
//		item.setLevelid(Integer.parseInt(levelId));
//		item.setListenexerciseimage("abc");
//		listenExDao.add(item);
//		return new ModelAndView("redirect:/AdminListenExercise");
//	}
		
}