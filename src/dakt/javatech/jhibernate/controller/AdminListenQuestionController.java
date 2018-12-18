package dakt.javatech.jhibernate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.ListenquestionDao;
import dakt.javatech.jhibernate.entity.Listenquestion;

@Controller
public class AdminListenQuestionController {
	@Autowired ListenquestionDao listQuestionDao;
	@RequestMapping(value="/AdminListListenQuestion", method=RequestMethod.GET)
	public ModelAndView listListenQuestion(int idListenExercis)
	{
		List<Listenquestion> list = new ArrayList<Listenquestion>();
		list= listQuestionDao.getListByListenExerciseId(idListenExercis);
		ModelAndView modelView = new ModelAndView("admin/listen_exercise/list_listenQuestion");
		
		modelView.addObject("listQuestion", list);
		return modelView;
	}
}
