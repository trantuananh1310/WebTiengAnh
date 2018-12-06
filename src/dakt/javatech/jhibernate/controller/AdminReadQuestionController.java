package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ReadquestionDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readquestion;

@Controller
public class AdminReadQuestionController {
	
	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ReadquestionDao readQuesDao;
	
	@RequestMapping(value="/AdminListReadQuestion", method=RequestMethod.GET)
	public ModelAndView listListenQuestion(int readexerciseid)
	{
		List<Readquestion> list = new ArrayList<Readquestion>();
		list= readQuesDao.getListByReadExId(readexerciseid);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView = new ModelAndView("admin/read_exercise/list_read_question");
		modelView.addObject("lstReadQuestion", list);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
}
