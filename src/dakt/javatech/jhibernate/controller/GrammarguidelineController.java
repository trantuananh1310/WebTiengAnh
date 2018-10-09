package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.GrammarguidelineDao;
import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.entity.Grammarguideline;
import dakt.javatech.jhibernate.entity.Level;

@Controller
public class GrammarguidelineController {

	@Autowired
	GrammarguidelineDao gramDao;
	
	@Autowired
	LevelDao levelDao;
	
	@RequestMapping(value="/listGrammarguideline", method=RequestMethod.GET)
	public ModelAndView getAllMembers(String level)
	{
		List<Grammarguideline> lstGrammar=gramDao.getListByLevelId(level);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("listgrammarguideline");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstGrammar", lstGrammar);
		return modelView;
	}
}
