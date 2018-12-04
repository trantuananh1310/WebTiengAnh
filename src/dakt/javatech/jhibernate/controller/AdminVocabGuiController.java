package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.VocabularyguidelineDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;


@Controller
public class AdminVocabGuiController {
	
	@Autowired 
	LevelDao levelDao;
	
	@Autowired
	VocabularyguidelineDao vocabDao;
	
	@RequestMapping(value="/AdminVocabularyGuideline", method=RequestMethod.GET)
	public ModelAndView AdminVocabularyGuideline()
	{
		List<Vocabularyguideline> list= new ArrayList<Vocabularyguideline>();
		list= vocabDao.list();
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView= new ModelAndView("admin/vocabulary_listen_admin/list_vocabularyguidelineadmin");
		modelView.addObject("listAdVocabGui",list);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
	
	@RequestMapping(value="/getListVocabByLevelIdAjax",method=RequestMethod.GET)
	public ModelAndView getListVocabByLevelIdAjax(String levelId)
	{
		List<Vocabularyguideline> list= new ArrayList<Vocabularyguideline>();
		if(levelId.equals("0")) list=vocabDao.list();
		else
			list= vocabDao.getListByLevelId(levelId);
		ModelAndView modelView= new ModelAndView("admin/vocabulary_listen_admin/list_vocab_bylevelidadmin");
		modelView.addObject("listAdVocabGui",list);
		return modelView;

	}

}
