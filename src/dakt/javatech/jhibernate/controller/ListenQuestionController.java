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

import com.sun.org.apache.bcel.internal.generic.LSTORE;

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

	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ListenquestionDao ListenQuestionDao;
	
	@RequestMapping(value="/ListListenQuestion", method=RequestMethod.GET)
	public ModelAndView getAllMembers(String ListenExerciseId)
	{
		List<Listenquestion> lstListenQuestion=ListenQuestionDao.getListByListenExerciseId(ListenExerciseId);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("list_listen_question");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstListenQuestion", lstListenQuestion);
		modelView.addObject("ListenExerciseid",ListenExerciseId);
		return modelView;
	}
	
	@RequestMapping(value="/AnswerListen_Tapescript", method=RequestMethod.POST)
	public ModelAndView getAllMembers(HttpServletRequest request, String ListenExerciseid)
	{
		List<Listenquestion> lstListenQuestion=ListenQuestionDao.getListByListenExerciseId(ListenExerciseid);
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
//			else{
//				ModelAndView modelView= new ModelAndView("listreadquestion");
//				modelView.addObject("lstLevel", lstLevel);
//				modelView.addObject("lstReadQuestion", lstReadQuestion);
//				modelView.addObject("msg","Bạn chưa trả lời hết các câu hỏi.");
//				modelView.addObject("readexerciseid",readexerciseid);
//				return modelView;
//			}
		}
		ModelAndView modelView=new ModelAndView(" result_listen_exercise");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstListenQuestion",lstListenQuestion);
		modelView.addObject("lstAnswerUser",lstAnswerUser);
		return modelView;
	}
}
