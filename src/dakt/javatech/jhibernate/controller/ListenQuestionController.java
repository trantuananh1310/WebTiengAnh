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
import dakt.javatech.jhibernate.dao.ListenexerciseDao;
import dakt.javatech.jhibernate.dao.ListenquestionDao;
import dakt.javatech.jhibernate.dao.ReadquestionDao;
import dakt.javatech.jhibernate.entity.AnswerUser;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Listenquestion;
import dakt.javatech.jhibernate.entity.Readquestion;

@Controller
public class ListenQuestionController {

	public static final int COUNT_PAGE = 2;

	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ListenquestionDao ListenQuestionDao;
	
	@RequestMapping(value="/ListListenQuestion", method=RequestMethod.GET)
	public ModelAndView getListenQuestionByLsExrId(String ListenExerciseId,int page)
	{
		int sumRow=0;
		int maxPage=0;
		int count=COUNT_PAGE;
		page=page-1;
		List<Listenquestion> lst=ListenQuestionDao.getListByListenExerciseId(Integer.parseInt(ListenExerciseId));
		List<Listenquestion> lstListenQuestion=ListenQuestionDao.getListByListenExerciseId(ListenExerciseId,page*COUNT_PAGE,COUNT_PAGE);
		List<Level> lstLevel=levelDao.list();
		sumRow = lst.size();
		if(sumRow%count != 0){
			maxPage = (sumRow/count)+1;
		}
		else{
			maxPage = (sumRow/count);
		}
		ModelAndView modelView=new ModelAndView("Listen_exercise/list_listen_question");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstListenQuestion", lstListenQuestion);
		modelView.addObject("ListenExerciseid",ListenExerciseId);
		modelView.addObject("page", page+1);
		modelView.addObject("maxpage", maxPage);
		return modelView;
	}
	
	@RequestMapping(value="/AnswerListen_Tapescript", method=RequestMethod.POST)
	public ModelAndView TapeScript(HttpServletRequest request, String ListenExerciseid,int page)
	{
		page=page-1;
		int count=COUNT_PAGE;
		List<Listenquestion> lstListenQuestion=ListenQuestionDao.getListByListenExerciseId(ListenExerciseid,page*COUNT_PAGE,COUNT_PAGE);
		List<Level> lstLevel=levelDao.list();
		int countrow=lstListenQuestion.size();
		List<AnswerUser> lstAnswerUser = new ArrayList<>();
		
		for(int i=0; i<countrow; i++){
			String answer = request.getParameter("answer["+i+"]");
			if(answer!=null){
				AnswerUser au=new AnswerUser();
				au.setNumber(lstListenQuestion.get(i).getListenquestionid());
				au.setAnswer(answer);
				lstAnswerUser.add(au);
			}
		}
		ModelAndView modelView=new ModelAndView("Listen_exercise/result_listen_exercise");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstListenQuestion",lstListenQuestion);
		modelView.addObject("lstAnswerUser",lstAnswerUser);
		return modelView;
	}
	@RequestMapping(value="/AnswerListen_Score", method=RequestMethod.POST)
	public ModelAndView check_Answer_Score(HttpServletRequest request, String ListenExerciseid,int page)
	{
		page=page-1;
		List<Listenquestion> lstListenQuestion=ListenQuestionDao.getListByListenExerciseId(ListenExerciseid,page*COUNT_PAGE,COUNT_PAGE);
		List<Level> lstLevel=levelDao.list();
		int countrow=lstListenQuestion.size();
		List<AnswerUser> lstAnswerUser = new ArrayList<>();
		
		for(int i=0; i<countrow; i++){
			String answer = request.getParameter("answer["+i+"]");
			if(answer!=null){
				AnswerUser au=new AnswerUser();
				au.setNumber(lstListenQuestion.get(i).getListenquestionid());
				au.setAnswer(answer);
				lstAnswerUser.add(au);
			}
		}
		ModelAndView modelView=new ModelAndView("Listen_exercise/result_listen_exercise_score");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstListenQuestion",lstListenQuestion);
		modelView.addObject("lstAnswerUser",lstAnswerUser);
		return modelView;
	}
}
