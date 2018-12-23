package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.GrammarguidelineDao;
import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.entity.Grammarguideline;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Listenexercise;

@Controller
public class GrammarguidelineController {

	@Autowired
	GrammarguidelineDao gramDao;
	
	@Autowired
	LevelDao levelDao;
	
	private static final int Count_Exc_Page=5;
	private static final int Count_Silde=3;

	@RequestMapping(value="/listGrammarguideline", method=RequestMethod.GET)
	public ModelAndView getListGrammarguideline1(String level, int page)
	{
		page=page-1;
		//  lấy tổng các chủ đề
		
		List<Grammarguideline> lstGrammar1=gramDao.getListByLevelId(level);
		int Total_Exc= lstGrammar1.size();
		// tỉnh tổng số trang
		int Total_Page;
		if(Total_Exc%Count_Exc_Page==0) Total_Page=Total_Exc/Count_Exc_Page;
		else Total_Page=Total_Exc/Count_Exc_Page +1;
		
		// Lấy tổng silde 
		int Total_Silde;
		 Total_Silde=Total_Page/Count_Silde ;
		// Silde hiện tại
		int Silde_Now;
		Silde_Now=page/Count_Silde;
		//Lấy ra list tên trang
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
		
		List<Grammarguideline> lstGrammar=gramDao.getListByLevelIdPhanTrang(level,Count_Exc_Page*page,Count_Exc_Page);
		
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("list_grammar_guideline");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstGrammar", lstGrammar);
		modelView.addObject("TotalPage",Total_Page );
		modelView.addObject("List_Page", List_Page);
		modelView.addObject("page", page+1);
		return modelView;
	}
	
	@RequestMapping(value="/contentGrammar", method=RequestMethod.GET)
	public ModelAndView getcontentGrammar(int id)
	{
		Grammarguideline item = gramDao.getById(id);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView = new ModelAndView("content_grammar");
		modelView.addObject("item", item);
		modelView.addObject("lstLevel", lstLevel);
		return modelView;
	}
}
