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
import dakt.javatech.jhibernate.dao.ListenguidelineDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.ListenGuideline;
import dakt.javatech.jhibernate.entity.Listenexercise;
import dakt.javatech.jhibernate.entity.Readexercise;
import dakt.javatech.jhibernate.entity.Readquestion;
import dakt.javatech.jhibernate.entity.Vocabularycontent;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;

@Controller
@EnableWebMvc
public class AdminListenGuidelineController {
	
	
	@Autowired 
	LevelDao levelDao;
	
	@Autowired
	ListenguidelineDao lisGuidao;
	
	@RequestMapping(value="/AdminListenGuideline", method=RequestMethod.GET)
	public ModelAndView AdminListenGuideline()
	{
		List<ListenGuideline> list= new ArrayList<ListenGuideline>();
		list= lisGuidao.list();
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView= new ModelAndView("admin/vocabulary_listen_admin/list_listenguideline_admin");
		modelView.addObject("listAdListenGui",list);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
	
	@RequestMapping(value="/getListListenByLevelIdAjax",method=RequestMethod.GET)
	public ModelAndView getListListenByLevelIdAjax(String levelId)
	{
		List<ListenGuideline> list= new ArrayList<ListenGuideline>();
		if(levelId.equals("0")) list=lisGuidao.list();
		else
			list= lisGuidao.getListByLevelId(levelId);
		ModelAndView modelView= new ModelAndView("admin/vocabulary_listen_admin/list_listen_bylevelidadmin");
		modelView.addObject("listAdListenGui",list);
		return modelView;

	}
	
	@RequestMapping(value="/addListenGuideline",method=RequestMethod.POST)
	public ModelAndView AddAndEditListenGuideline(String listenname,Integer levelid, String listenguidelineid,String content, @RequestParam(value = "file") CommonsMultipartFile commonsMultipartFiles,
			ModelMap modelMap,HttpServletRequest request)
	{
		String nameFile = commonsMultipartFiles.getOriginalFilename();
		if(!listenguidelineid.isEmpty() &&listenguidelineid!=null  ) {
			ListenGuideline lisGui = new ListenGuideline();
			lisGui = lisGuidao.getById(Integer.parseInt(listenguidelineid));
			lisGui.setListenname(listenname);
			lisGui.setLevelid(levelid);
			lisGui.setListenimage(nameFile);
			lisGui.setContent(content);
			lisGuidao.update(lisGui);
		}
		else {
			ListenGuideline listenGui = new ListenGuideline();
			listenGui.setListenname(listenname);
			listenGui.setLevelid(levelid);
			listenGui.setListenimage(nameFile);
			listenGui.setContent(content);
			lisGuidao.add(listenGui);
		}
		String dirFile = request.getRealPath("images\\Listengui");
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
		ModelAndView modelView= new ModelAndView("redirect:/AdminListenGuideline");
		return modelView;
	}
	
	
	@RequestMapping(value="/AdminListenGuidelineContent", method=RequestMethod.GET)
	public ModelAndView getContentById(String id)
	{
		
		List<Level> lstLevel=levelDao.list();
		ListenGuideline  content= lisGuidao.getListenGuidelineById(id);
		ModelAndView modelView=new ModelAndView("admin/vocabulary_listen_admin/list_listen_contentadmin");
		modelView.addObject("listLevel", lstLevel);
		modelView.addObject("Content", content);
		
		return modelView;
	}
	
	@RequestMapping(value="/editListenGuideline",method=RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody ListenGuideline editListenGuideline(Integer listenGuidelineid)	
	{
		ListenGuideline listenGui = new ListenGuideline();
		listenGui = lisGuidao.getById(listenGuidelineid);
		return listenGui;
	}
	
	@RequestMapping(value="/deleteListenGuideline",method=RequestMethod.POST)
	public void deleteListenGuideline(Integer listenGuidelineId)	
	{
		lisGuidao.delete(listenGuidelineId);
	}
	
//	@RequestMapping(value="/deleteListenGuideline",method=RequestMethod.POST)
//	public void deleteListenGuideline(Integer listenGuidelineId)	
//	{
//		List<ListenGuideline> lstVocabCon = new ArrayList<>();
//		lstVocabCon = vocabConDao.getListByLevelId(vocabularyGuidelineId);
//		if(lstVocabCon!=null || lstVocabCon.size()!=0) {
//			for (Vocabularycontent vocabularycontent : lstVocabCon) {
//				vocabConDao.delete(vocabularycontent.getVocabularyguidelineid());
//			}
//		}
//		vocabDao.delete(vocabularyGuidelineId);
//	}

}
