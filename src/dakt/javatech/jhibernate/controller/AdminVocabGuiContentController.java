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
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.VocabularycontentDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Listenquestion;
import dakt.javatech.jhibernate.entity.Readquestion;
import dakt.javatech.jhibernate.entity.Vocabularycontent;

@Controller

public class AdminVocabGuiContentController {

	@Autowired 
	LevelDao levelDao;
	
	@Autowired
	VocabularycontentDao vocabconDao;
	
	@RequestMapping(value="/AdminVocabularyContent", method=RequestMethod.GET)
	public ModelAndView listVocabContent(int vocabid)
	{
		List<Vocabularycontent> list = new ArrayList<Vocabularycontent>();
		list= vocabconDao.getListByLevelId(vocabid);
		ModelAndView modelView = new ModelAndView("admin/vocabulary_listen_admin/list_vocabularycontentadmin");
		modelView.addObject("listAdVocabCon", list);
		return modelView;
	}
	
	@RequestMapping(value="/addVocabularyContent", method=RequestMethod.POST)
	@ResponseBody
	public void AddAndEditVocabularyContent(Vocabularycontent vocabularycontent, String vocabularycontentid, ModelMap modelMap,HttpServletRequest request)
	{
		
		if(vocabularycontentid!=null && !vocabularycontentid.isEmpty()) {
			Vocabularycontent vocabCon = new Vocabularycontent();
			vocabCon = vocabconDao.getById(Integer.parseInt(vocabularycontentid));
			vocabCon.setVocabularycontentname(vocabularycontent.getVocabularycontentname());
			vocabCon.setTranscribe(vocabularycontent.getTranscribe());
//			vocabCon.setImage(vocabularycontent.getImage());
//			vocabCon.setAudiomp3(vocabularycontent.getAudiomp3());
			vocabCon.setMean(vocabularycontent.getMean());
			vocabCon.setVocabularyguidelineid(vocabularycontent.getVocabularyguidelineid());
			vocabconDao.update(vocabCon);
		}
		else {
			vocabconDao.add(vocabularycontent);
		}
		
	}
	
	@RequestMapping(value="/editVocabularyContent",method=RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody Vocabularycontent EditVocabularyContent(Integer vocabularyContentId)	
	{
		Vocabularycontent vocabContent = new Vocabularycontent();
		vocabContent = vocabconDao.getById(vocabularyContentId);
		return vocabContent;
	}
	
	@RequestMapping(value="/deleteVocabularyContent",method=RequestMethod.POST)
	public void deleteVocabularyContent(Integer vocabularyContentId)	
	{
		vocabconDao.delete(vocabularyContentId);
	}
}
