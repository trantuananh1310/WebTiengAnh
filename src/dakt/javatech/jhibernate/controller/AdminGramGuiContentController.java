package dakt.javatech.jhibernate.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.GrammarguidelineDao;
import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.entity.Grammarguideline;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.ListenGuideline;
import dakt.javatech.jhibernate.entity.Readquestion;

@Controller
public class AdminGramGuiContentController {
	@Autowired
	LevelDao levelDao;
	@Autowired
	GrammarguidelineDao gramGuiDao;
	
	@RequestMapping(value="/AdminListGrammarguidelineContent", method=RequestMethod.GET)
	public ModelAndView listGrammarguideline(int grammarguidelineid)
	{
		Grammarguideline item = gramGuiDao.getById(grammarguidelineid);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView = new ModelAndView("admin/grammar_guideline/list_gram_contentadmin");
		modelView.addObject("lstgram", item);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
	
}
