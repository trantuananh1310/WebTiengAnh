package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ReadexerciseDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readexercise;

@Controller
public class ReadExerciseController {

	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ReadexerciseDao readExDao;
	
	@RequestMapping(value="/listReadExercise", method=RequestMethod.GET)
	public ModelAndView getAllMembers(String level)
	{
		List<Readexercise> lstReadExcercise=readExDao.getListByLevelId(level);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("list_read_excercise");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstReadExcercise", lstReadExcercise);
		return modelView;
	}
}
