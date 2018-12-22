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
import dakt.javatech.jhibernate.entity.Readexercise;
import dakt.javatech.jhibernate.entity.Readquestion;


@Controller
public class AdminGramGuiController {
	@Autowired
	LevelDao levelDao;
	@Autowired
	GrammarguidelineDao gramGuiDao;
	
	@RequestMapping(value="/AdminGrammarguideline", method=RequestMethod.GET)
	public ModelAndView AdminGrammarguideline()
	{
		List<Grammarguideline> lstGramGui= new ArrayList<Grammarguideline>();
		lstGramGui = gramGuiDao.list();
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView= new ModelAndView("admin/grammar_guideline/list_gram_guideline");
		modelView.addObject("lstGramGui",lstGramGui);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
	@RequestMapping(value="/addGrammarGui", method=RequestMethod.POST)
	public ModelAndView AddGrammarGui(String grammarname,Integer levelid, String grammarguidelineidd,String content, @RequestParam(value = "file") CommonsMultipartFile commonsMultipartFiles,
			ModelMap modelMap,HttpServletRequest request)
	{
		String nameFile = commonsMultipartFiles.getOriginalFilename();
		if(!grammarguidelineidd.isEmpty() &&grammarguidelineidd!=null  ) {
			Grammarguideline gramGui = new Grammarguideline();
			gramGui = gramGuiDao.getById(Integer.parseInt(grammarguidelineidd));
			gramGui.setGrammarname(grammarname);
			gramGui.setLevelid(levelid);
			gramGui.setGrammarimage(nameFile);
			gramGui.setContent(content);
			gramGuiDao.update(gramGui);
		}
		else {
			Grammarguideline grammarGui = new Grammarguideline();
			grammarGui.setGrammarname(grammarname);
			grammarGui.setGrammarimage(nameFile);
			grammarGui.setLevelid(levelid);
			grammarGui.setContent(content);
			gramGuiDao.add(grammarGui);
		}
		String dirFile = request.getRealPath("images\\grammargui");
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
		ModelAndView modelView= new ModelAndView("redirect:/AdminGrammarguideline");
		return modelView;
	}
	@RequestMapping(value="/editGrammarGuideline",method=RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody Grammarguideline editGrammarGuideline(Integer grammarGuidelineId)	
	{
		Grammarguideline grammarGui = new Grammarguideline();
		grammarGui = gramGuiDao.getById(grammarGuidelineId);
		return grammarGui;
	}
	@RequestMapping(value="/deleteGrammarGuideline",method=RequestMethod.POST)
	public void deleteGrammarGuideline(Integer grammarGuidelineId)	
	{
		gramGuiDao.delete(grammarGuidelineId);
	}
//	@RequestMapping(value="/deleteGrammarGuideline",method=RequestMethod.POST)
//	public void deleteGrammarGuideline(Integer grammarGuidelineId)	
//	{
//		List<Grammarguideline> lstGrammarGui = new ArrayList<>();
//		lstGrammarGui = gramGuiDao.getById(grammarGuidelineId);
//		if(lstReadQues!=null || lstReadQues.size()!=0) {
//			for (Readquestion readquestion : lstReadQues) {
//				readQuesDao.delete(readquestion.getReadquestionid());
//			}
//		}
//		readExDao.delete(readExerciseId);
//	}
}
