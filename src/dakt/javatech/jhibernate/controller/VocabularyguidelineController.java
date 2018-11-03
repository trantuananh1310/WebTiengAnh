package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.VocabularyguidelineDao;
import dakt.javatech.jhibernate.dao.VocabularycontentDao;
import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Listenexercise;

@Controller
public class VocabularyguidelineController {

	private static final int Count_Exc_Page=5;
	private static final int Count_Silde=4;
	
	@Autowired
	VocabularyguidelineDao vocabDao;
	
	
	@Autowired
	LevelDao levelDao;
	
//	@RequestMapping(value="/listVocabularyguideline", method=RequestMethod.GET)
//	public ModelAndView getAllMembers(String level)
//	{
//		List<Vocabularyguideline> lstVocab=vocabDao.getListByLevelId(level);
//		List<Level> lstLevel=levelDao.list();
//		ModelAndView modelView=new ModelAndView("Vocabulary_Listen_guideline/list_vocabulary_guideline");
//		modelView.addObject("lstLevel", lstLevel);
//		modelView.addObject("lstVocab", lstVocab);
//		return modelView;
//	}
	
	@RequestMapping(value="/listVocabularyguideline", method=RequestMethod.GET)
	public ModelAndView getAllMembers(String level, int Page)
	{	
		Page=Page-1;
		// Lấy tổng số trang
		List<Vocabularyguideline> lstVocab1=vocabDao.getListByLevelId(level);
		int Total_Exc= lstVocab1.size();
		int Total_Page;
		if(Total_Exc%Count_Exc_Page==0) Total_Page=Total_Exc/Count_Exc_Page;
		else Total_Page=Total_Exc/Count_Exc_Page +1;
		// Lấy tổng silde 
		int Total_Silde;
		 Total_Silde=Total_Page/Count_Silde ;
		// Silde hiện tại
		int Silde_Now;
		Silde_Now=Page/Count_Silde;
		List<Integer> LsPage= new ArrayList<Integer>();
		
		// lấy list các trang  hiển thị tương ứng với trang hiện tại
		List<Integer> List_Page = new ArrayList<Integer>();
		if(Silde_Now==Total_Silde){
			for( int i=(Silde_Now)*Count_Silde+1;i<=Total_Page;i++){
				List_Page.add(i);
			}
		}
		else{
			for( int i=(Silde_Now)*Count_Silde+1;i<=(Silde_Now+1)*Count_Silde;i++){
				List_Page.add(i);
			}
		}
			
			
		for(int i=Count_Silde*(Page-1)+1;i<=Count_Silde*Page+1;i++ )LsPage.add(i);
		List<Vocabularyguideline> lstVocab=vocabDao.getListByLevelId(level,Count_Exc_Page*Page,Count_Exc_Page);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("Vocabulary_Listen_guideline/list_vocabulary_guideline");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstVocab", lstVocab);
		modelView.addObject("TotalPage",Total_Page );
		modelView.addObject("levelid", level);
		modelView.addObject("ListPage", List_Page);
		modelView.addObject("Page", Page+1);
		return modelView;
	}

}
