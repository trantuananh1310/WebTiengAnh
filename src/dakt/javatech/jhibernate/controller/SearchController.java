package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.GrammarguidelineDao;
import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ListenexerciseDao;
import dakt.javatech.jhibernate.dao.ListenguidelineDao;
import dakt.javatech.jhibernate.dao.ReadexerciseDao;
import dakt.javatech.jhibernate.dao.VocabularyguidelineDao;
import dakt.javatech.jhibernate.entity.Grammarguideline;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.ListenGuideline;
import dakt.javatech.jhibernate.entity.Listenexercise;
import dakt.javatech.jhibernate.entity.Readexercise;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;
@Controller
public class SearchController {

	@Autowired LevelDao levelDao;
	@Autowired VocabularyguidelineDao vocabularyGuidelineDao;
	@Autowired GrammarguidelineDao grammarGuidelineDao;
	@Autowired ListenguidelineDao listenGuilineDao;
	@Autowired ListenexerciseDao listenExerciseDao;
	@Autowired ReadexerciseDao readexerciseDao;
	private static final int soLuong=5;
	private static final int countSilde=3;

	@RequestMapping(value="/SearchAll", method=RequestMethod.GET)
	public ModelAndView SearchAll(String key,int page)
	{
		List<Level> lstLevel=levelDao.list();
		List<Vocabularyguideline> listVocabularygl= vocabularyGuidelineDao.list();
		List<Grammarguideline> listGrammarguidelines= grammarGuidelineDao.list();
		List<ListenGuideline> listenGuidelines= listenGuilineDao.list();
		List<Listenexercise> listenexercises = listenExerciseDao.list();
		List<Readexercise> listReadexercises= readexerciseDao.list();
		HashMap<String, List<Object>> hashMap = new HashMap<>();
		List<Object> listVocabularySearch=new ArrayList<Object>();
		for (Vocabularyguideline item : listVocabularygl) {
			if(item.getVocabularyname().contains(key)==true)
			{
				listVocabularySearch.add(item);
			}
		}
		List<Object> listGrammarSearch=new ArrayList<Object>();
		for (Grammarguideline item : listGrammarguidelines) {
			if(item.getGrammarname().contains(key)==true)
			{
				listGrammarSearch.add(item);
			}
		}
		List<Object> listListenGlSearch=new ArrayList<Object>();
		for (ListenGuideline item : listenGuidelines) {
			if(item.getListenname().contains(key)==true)
			{
				listListenGlSearch.add(item);
			}
		}
		List<Object> listListenExrSearch=new ArrayList<Object>();
		for (Listenexercise item : listenexercises) {
			if(item.getListenexercisename().contains(key)==true)
			{
				listListenExrSearch.add(item);
			}
		}
		List<Object> listReadSearch=new ArrayList<Object>();
		for (Readexercise item : listReadexercises) {
			if(item.getReadname().contains(key)==true)
			{
				listReadSearch.add(item);
			}
		}
		
		int i=0;int j=0;
		int totalResult=listVocabularySearch.size()+listGrammarSearch.size()+listListenGlSearch.size()+listListenExrSearch.size()+listReadSearch.size();
		int max=0;
		if(page*soLuong>totalResult) max=totalResult;
		else max=page*soLuong;
		List<Object> listObject1= new ArrayList<>();
		List<Object> listObject2= new ArrayList<>();
		List<Object> listObject3= new ArrayList<>();
		List<Object> listObject4= new ArrayList<>();
		List<Object> listObject5= new ArrayList<>();
		for (Object item : listVocabularySearch) {
			if((page-1)*soLuong+1>i+1||i+1>max){
				listObject1.add(item);
			}
			i++;
		}
		for (Object item : listGrammarSearch) {
			if((page-1)*soLuong+1>i+1||i+1>max){
				listObject2.add(item);
			}
			i++;
		}
		for (Object item : listListenGlSearch) {
			if((page-1)*soLuong+1>i+1||i+1>max){
				listObject3.add(item);
			}
			i++;
		}
		for (Object item : listListenExrSearch) {
			if((page-1)*soLuong+1>i+1||i+1>max){
				listObject4.add(item);
			}
			i++;
		}
		for (Object item : listReadSearch) {
			if((page-1)*soLuong+1>i+1||i+1>max){
				listObject5.add(item);
			}
			i++;
		}
		listVocabularySearch.removeAll(listObject1);
		listGrammarSearch.removeAll(listObject2);
		listListenGlSearch.removeAll(listObject3);
		listListenExrSearch.removeAll(listObject4);
		listReadSearch.removeAll(listObject5);
		
		hashMap.put("Vocabularyguideline",listVocabularySearch);
		hashMap.put("Grammarguideline",listGrammarSearch);
		hashMap.put("ListenGuideline",listListenGlSearch);
		hashMap.put("Listenexercise",listListenExrSearch);
		hashMap.put("Readexercise",listReadSearch);
		
		page=page-1;
		// Lấy tổng số trang
		int Total_Page;
		if(totalResult%soLuong==0) Total_Page=totalResult/soLuong;
		else Total_Page=totalResult/soLuong +1;
		// Lấy tổng silde 
		int Total_Silde;
		 Total_Silde=Total_Page/countSilde ;
		// Silde hiện tại
		int Silde_Now;
		Silde_Now=page/countSilde;
		List<Integer> LsPage= new ArrayList<Integer>();
		
		// lấy list các trang  hiển thị tương ứng với trang hiện tại
		List<Integer> List_Page = new ArrayList<Integer>();
		if(Silde_Now==Total_Silde){
			for( int i1=(Silde_Now)*countSilde+1;i1<=Total_Page;i1++){
				List_Page.add(i1);
			}
		}
		else{
			for( int i1=(Silde_Now)*countSilde+1;i1<=(Silde_Now+1)*countSilde;i1++){
				List_Page.add(i1);
			}
		}
		
		
		
		ModelAndView modelView= new ModelAndView("search");
		modelView.addObject("key", key);
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("list", hashMap);
		modelView.addObject("TotalPage",Total_Page );
		modelView.addObject("ListPage", List_Page);
		modelView.addObject("Page", page+1);
		return modelView;
	}
	

}
