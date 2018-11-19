package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ReadquestionDao;
import dakt.javatech.jhibernate.entity.AnswerUser;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readquestion;

@Controller
public class ReadQuestionController {

	public static final int COUNT_PAGE = 2;
	
	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ReadquestionDao readQuestionDao;
	
//	@RequestMapping(value="/listReadQuestion", method=RequestMethod.GET)
//	public ModelAndView getAllMembers(String readexercise)
//	{
//		List<Readquestion> lstReadQuestion=readQuestionDao.getListByLevelId(readexercise);
//		List<Level> lstLevel=levelDao.list();
//		ModelAndView modelView=new ModelAndView("list_read_question");
//		modelView.addObject("lstLevel", lstLevel);
//		modelView.addObject("lstReadQuestion", lstReadQuestion);
//		modelView.addObject("readexerciseid",readexercise);
//		return modelView;
//	}
	
	@RequestMapping(value="/listReadQuestion", method=RequestMethod.GET)
	public ModelAndView getAllMembers(String page, String readexercise)
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
		List<Readquestion> lstReadQuestion=readQuestionDao.getListByLevelId(readexercise);
		List<Readquestion> lstReadQuestionPage=readQuestionDao.getListPage((pageid-1), count, readexercise);
		List<Level> lstLevel=levelDao.list();
		sumRow = lstReadQuestion.size();
		if(sumRow%count != 0){
			maxPage = (sumRow/count)+1;
		}
		else{
			maxPage = (sumRow/count);
		}
		ModelAndView modelView=new ModelAndView("list_read_question");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstReadQuestion", lstReadQuestionPage);
		modelView.addObject("readexerciseid",readexercise);
		modelView.addObject("page", page);
		modelView.addObject("maxpage", maxPage);
		return modelView;
	}
	
	@RequestMapping(value="/listReadQuestionPage", method=RequestMethod.GET)
	public ModelAndView getListPage(String page, String readexercise)
	{
		int pageid= Integer.parseInt(page);
		int count=2;
		if(pageid==1){
			
		}
		else{
			pageid=pageid-1;
			pageid=pageid*count +1;
		}
		
		List<Readquestion> lstReadQuestion=readQuestionDao.list((pageid-1), count);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("list_read_question_page");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstReadQuestion", lstReadQuestion);
		modelView.addObject("readexerciseid",readexercise);
		modelView.addObject("page", page);
		return modelView;
	}
	
	@RequestMapping(value="/checkAction", method=RequestMethod.POST)
	public ModelAndView getAllMembers(HttpServletRequest request, String readexerciseid,String page)
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
		List<Readquestion> lstReadQuestionPage=readQuestionDao.getListPage((pageid-1), count, readexerciseid);
		List<Level> lstLevel=levelDao.list();
		int countrow=lstReadQuestionPage.size();
		List<AnswerUser> lstAnswerUser = new ArrayList<>();
		
		for(int i=0; i<countrow; i++){
			String answer = request.getParameter("answer["+i+"]");
			if(answer!=null){
				AnswerUser au=new AnswerUser();
				au.setNumber(lstReadQuestionPage.get(i).getReadquestionid());
				au.setAnswer(answer);
				lstAnswerUser.add(au);
			}
		}
		ModelAndView modelView=new ModelAndView("result_read_exercise_tapescript");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstReadQuestion",lstReadQuestionPage);
		modelView.addObject("lstAnswerUser",lstAnswerUser);
		return modelView;
	}
	
	@RequestMapping(value="/checkScoreReadQuestion", method=RequestMethod.POST)
	public ModelAndView checkScoreReadQuestion(HttpServletRequest request, String readexerciseid,String page)
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
		List<Readquestion> lstReadQuestionPage=readQuestionDao.getListPage((pageid-1), count, readexerciseid);
		/////////////////////
//		List<Readquestion> lstReadQuestion=readQuestionDao.getListByLevelId(readexerciseid);
//		List<Level> lstLevel=levelDao.list();
		int countrow=lstReadQuestionPage.size();
		List<AnswerUser> lstAnswerUser = new ArrayList<>();
		
		for(int i=0; i<countrow; i++){
			String answer = request.getParameter("answer["+i+"]");
			if(answer!=null){
				AnswerUser au=new AnswerUser();
				au.setNumber(lstReadQuestionPage.get(i).getReadquestionid());
				au.setAnswer(answer);
				lstAnswerUser.add(au);
			}
		}
		ModelAndView modelView=new ModelAndView("result_read_exercise_score");
//		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstReadQuestion",lstReadQuestionPage);
		modelView.addObject("lstAnswerUser",lstAnswerUser);
		return modelView;
	}
	
//	@RequestMapping(value="/checkAction", method=RequestMethod.POST)
//	public ModelAndView getAllMembers(HttpServletRequest request, String readexerciseid)
//	{
//		List<Readquestion> lstReadQuestion=readQuestionDao.getListByLevelId(readexerciseid);
//		List<Level> lstLevel=levelDao.list();
//		int countrow=lstReadQuestion.size();
//		List<AnswerUser> lstAnswerUser = new ArrayList<>();
//		
//		for(int i=0; i<countrow; i++){
//			String answer = request.getParameter("answer["+i+"]");
//			if(answer!=null){
//				AnswerUser au=new AnswerUser();
//				au.setNumber(lstReadQuestion.get(i).getReadquestionid());
//				au.setAnswer(answer);
//				lstAnswerUser.add(au);
//			}
////			else{
////				ModelAndView modelView= new ModelAndView("listreadquestion");
////				modelView.addObject("lstLevel", lstLevel);
////				modelView.addObject("lstReadQuestion", lstReadQuestion);
////				modelView.addObject("msg","Bạn chưa trả lời hết các câu hỏi.");
////				modelView.addObject("readexerciseid",readexerciseid);
////				return modelView;
////			}
//		}
//		ModelAndView modelView=new ModelAndView("result_read_exercise_tapescript");
//		modelView.addObject("lstLevel", lstLevel);
//		modelView.addObject("lstReadQuestion",lstReadQuestion);
//		modelView.addObject("lstAnswerUser",lstAnswerUser);
//		return modelView;
//	}
	
//	@RequestMapping(value="/checkScoreReadQuestion", method=RequestMethod.POST)
//	public ModelAndView checkScoreReadQuestion(HttpServletRequest request, String readexerciseid)
//	{
//		List<Readquestion> lstReadQuestion=readQuestionDao.getListByLevelId(readexerciseid);
////		List<Level> lstLevel=levelDao.list();
//		int countrow=lstReadQuestion.size();
//		List<AnswerUser> lstAnswerUser = new ArrayList<>();
//		
//		for(int i=0; i<countrow; i++){
//			String answer = request.getParameter("answer["+i+"]");
//			if(answer!=null){
//				AnswerUser au=new AnswerUser();
//				au.setNumber(lstReadQuestion.get(i).getReadquestionid());
//				au.setAnswer(answer);
//				lstAnswerUser.add(au);
//			}
//		}
//		ModelAndView modelView=new ModelAndView("result_read_exercise_score");
////		modelView.addObject("lstLevel", lstLevel);
//		modelView.addObject("lstReadQuestion",lstReadQuestion);
//		modelView.addObject("lstAnswerUser",lstAnswerUser);
//		return modelView;
//	}
	
	
	
}
