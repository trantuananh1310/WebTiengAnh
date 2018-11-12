package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.VocabularycontentDao;
import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readquestion;
import dakt.javatech.jhibernate.entity.Vocabularycontent;

@Controller
public class VocabularyContentController {


	public static final int COUNT_PAGE = 4;
	
	
	
	@Autowired
	VocabularycontentDao vocabctDao;
	
	@Autowired
	LevelDao levelDao;
	
	
	
//	@RequestMapping(value="/contentvocabulary", method=RequestMethod.GET)
//	public ModelAndView getContentById(String vocabid)
//	{
//		List<Vocabularycontent> lstContent=vocabctDao.getListByLevelId(vocabid);
//		List<Level> lstLevel=levelDao.list();		
//		ModelAndView modelView=new ModelAndView("Vocabulary_Listen_guideline/content_vocabulary");
//		modelView.addObject("lstLevel", lstLevel);
//		modelView.addObject("lstContent", lstContent);
//        return modelView;
//	}
	
	@RequestMapping(value="/contentvocabulary", method=RequestMethod.GET)
	public ModelAndView getAllMembers(String page, String vocabid)
	{
		int sumRow=0;
		int maxPage=0;
		int pageid= Integer.parseInt(page);
		int count=COUNT_PAGE;
		if(pageid==1){
		}
		else{
			pageid=pageid-1;
			pageid=pageid*count +1;
		}
		List<Vocabularycontent> lstContent=vocabctDao.getListByLevelId(vocabid);
		List<Vocabularycontent> lstContentPage=vocabctDao.getListPage((pageid-1), count, vocabid);
		List<Level> lstLevel=levelDao.list();
		sumRow = lstContent.size();
		if(sumRow%count != 0){
			maxPage = (sumRow/count)+1;
		}
		else{
			maxPage = (sumRow/count);
		}
		ModelAndView modelView=new ModelAndView("Vocabulary_Listen_guideline/content_vocabulary");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstContent", lstContentPage);
		modelView.addObject("vocabularyid",vocabid);
		modelView.addObject("page", page);
		modelView.addObject("maxpage", maxPage);
		return modelView;
	}
	

}
