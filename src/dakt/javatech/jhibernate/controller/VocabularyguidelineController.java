package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.VocabularyguidelineDao;
import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;
import dakt.javatech.jhibernate.entity.Level;

@Controller
public class VocabularyguidelineController {

	@Autowired
	VocabularyguidelineDao vocabDao;
	
	@Autowired
	LevelDao levelDao;
	
	@RequestMapping(value="/listVocabularyguideline", method=RequestMethod.GET)
	public ModelAndView getAllMembers(String level)
	{
		List<Vocabularyguideline> lstVocab=vocabDao.getListByLevelId(level);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("list_vocabulary_guideline");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstVocab", lstVocab);
		return modelView;
	}
	
	@RequestMapping(value="/contentvocabulary", method=RequestMethod.GET)
	public ModelAndView getAllMembers()
	{
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("content_vocabulary");
		modelView.addObject("lstLevel", lstLevel);		
        return modelView;
	}
}
