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
import dakt.javatech.jhibernate.dao.ReadquestionDao;
import dakt.javatech.jhibernate.entity.AnswerUser;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readquestion;

@Controller
public class ReadQuestionController {

	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ReadquestionDao readQuestionDao;
	
	@RequestMapping(value="/listReadQuestion", method=RequestMethod.GET)
	public ModelAndView getAllMembers(String readexercise)
	{
		List<Readquestion> lstReadQuestion=readQuestionDao.getListByLevelId(readexercise);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView=new ModelAndView("list_read_question");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstReadQuestion", lstReadQuestion);
		modelView.addObject("readexerciseid",readexercise);
		return modelView;
	}
	
	@RequestMapping(value="/checkAction", method=RequestMethod.POST)
	public ModelAndView getAllMembers(HttpServletRequest request, String readexerciseid)
	{
		List<Readquestion> lstReadQuestion=readQuestionDao.getListByLevelId(readexerciseid);
		List<Level> lstLevel=levelDao.list();
		int countrow=lstReadQuestion.size();
		List<AnswerUser> lstAnswerUser = new ArrayList<>();
		
		for(int i=0; i<countrow; i++){
			String answer = request.getParameter("answer["+i+"]");
			if(answer!=null){
				AnswerUser au=new AnswerUser();
				au.setNumber(lstReadQuestion.get(i).getReadquestionid());
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
		ModelAndView modelView=new ModelAndView("result_read_exercise");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("lstReadQuestion",lstReadQuestion);
		modelView.addObject("lstAnswerUser",lstAnswerUser);
		return modelView;
	}
}
