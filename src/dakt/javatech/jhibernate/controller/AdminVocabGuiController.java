package dakt.javatech.jhibernate.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.VocabularycontentDao;
import dakt.javatech.jhibernate.dao.VocabularyguidelineDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Vocabularycontent;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;


@Controller
@EnableWebMvc
public class AdminVocabGuiController {
	
	@Autowired 
	LevelDao levelDao;
	
	@Autowired
	VocabularyguidelineDao vocabDao;
	
	@Autowired
	VocabularycontentDao vocabConDao;
	
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
	
	@RequestMapping(value="/addVocabularyGuideline", method=RequestMethod.POST)
	public ModelAndView AddAndEditVocabularyGuideline(String vocabularyname,Integer levelid, String vocabularyguidelineid, @RequestParam(value = "file") CommonsMultipartFile commonsMultipartFiles,
			ModelMap modelMap,HttpServletRequest request)
	{
		String nameFile = commonsMultipartFiles.getOriginalFilename();
		if(!vocabularyguidelineid.isEmpty() &&vocabularyguidelineid!=null  ) {
			Vocabularyguideline vocabGui = new Vocabularyguideline();
			vocabGui = vocabDao.getById(Integer.parseInt(vocabularyguidelineid));
			vocabGui.setVocabularyname(vocabularyname);
			vocabGui.setLevelid(levelid);
			vocabGui.setVocabularyimage(nameFile);
			vocabDao.update(vocabGui);
		}
		else {
			Vocabularyguideline vocabGuideline = new Vocabularyguideline();
			vocabGuideline.setVocabularyname(vocabularyname);
			vocabGuideline.setVocabularyimage(nameFile);
			vocabGuideline.setLevelid(levelid);
			vocabDao.add(vocabGuideline);
		}
		String dirFile = request.getRealPath("images\\Vocabgui");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			commonsMultipartFiles.transferTo(new File(fileDir + File.separator + nameFile));
			System.out.println("Upload file thành công");
			modelMap.addAttribute("filename", nameFile);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Upload file thất bại");
		}
		ModelAndView modelView= new ModelAndView("redirect:/AdminVocabularyGuideline");
		return modelView;
	}
	
	@RequestMapping(value="/editVocabularyGuideline",method=RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody Vocabularyguideline editVocabularyguideline(Integer vocabularyGuidelineId)	
	{
		Vocabularyguideline vocabGuide = new Vocabularyguideline();
		vocabGuide = vocabDao.getById(vocabularyGuidelineId);
		return vocabGuide;
	}
	
	@RequestMapping(value="/deleteVocabularyGuideline",method=RequestMethod.POST)
	public void deleteVocabularyGuideline(Integer vocabularyGuidelineId)	
	{
		List<Vocabularycontent> lstVocabCon = new ArrayList<>();
		lstVocabCon = vocabConDao.getListByLevelId(vocabularyGuidelineId);
		if(lstVocabCon!=null || lstVocabCon.size()!=0) {
			for (Vocabularycontent vocabularycontent : lstVocabCon) {
				vocabConDao.delete(vocabularycontent.getVocabularyguidelineid());
			}
		}
		vocabDao.delete(vocabularyGuidelineId);
	}

}
