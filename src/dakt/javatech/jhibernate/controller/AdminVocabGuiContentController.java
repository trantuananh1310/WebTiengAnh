package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.VocabularycontentDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Listenquestion;
import dakt.javatech.jhibernate.entity.Vocabularycontent;

@Controller

public class AdminVocabGuiContentController {

	@Autowired 
	LevelDao levelDao;
	
	@Autowired
	VocabularycontentDao vocabconDao;
	
	@RequestMapping(value="/AdminVocabularyContent", method=RequestMethod.GET)
	public ModelAndView listVocabContent(String vocabid)
	{
		List<Vocabularycontent> list = new ArrayList<Vocabularycontent>();
		list= vocabconDao.getListByLevelId(vocabid);
		ModelAndView modelView = new ModelAndView("admin/vocabulary_listen_admin/list_vocabularycontentadmin");
		modelView.addObject("listAdVocabCon", list);
		return modelView;
	}
}
