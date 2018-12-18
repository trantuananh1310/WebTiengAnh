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
import dakt.javatech.jhibernate.dao.ReadquestionDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readquestion;

@Controller
@EnableWebMvc
public class AdminReadQuestionController {
	
	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ReadquestionDao readQuesDao;
	
	@RequestMapping(value="/AdminListReadQuestion", method=RequestMethod.GET)
	public ModelAndView listReadQuestion(int readexerciseid)
	{
		List<Readquestion> list = new ArrayList<Readquestion>();
		list= readQuesDao.getListByReadExId(readexerciseid);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView = new ModelAndView("admin/read_exercise/list_read_question");
		modelView.addObject("lstReadQuestion", list);
		modelView.addObject("listLevel",lstLevel);
		modelView.addObject("readexerciseid", readexerciseid);
		return modelView;
	}
	
	@RequestMapping(value="/addReadQuestion", method=RequestMethod.POST)
	@ResponseBody
	public void AddAndEditReadQuestion(Readquestion readQuestion, String readquestionid,ModelMap modelMap,HttpServletRequest request)
	{
		
		if(readquestionid!=null && !readquestionid.isEmpty()) {
			Readquestion readQues = new Readquestion();
			readQues = readQuesDao.getById(Integer.parseInt(readquestionid));
			readQues.setQuestion(readQuestion.getQuestion());
			readQues.setOption1(readQuestion.getOption1());
			readQues.setOption2(readQuestion.getOption2());
			readQues.setOption3(readQuestion.getOption3());
			readQues.setOption4(readQuestion.getOption4());
			readQues.setCorrectanswer(readQuestion.getCorrectanswer());
			readQues.setReadexerciseid(readQuestion.getReadexerciseid());
			readQuesDao.update(readQues);
		}
		else {
			readQuesDao.add(readQuestion);
		}
	}
	
	@RequestMapping(value="/editReadQuestion",method=RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody Readquestion EditReadQuestion(Integer readQuestionId)	
	{
		Readquestion readQues = new Readquestion();
		readQues = readQuesDao.getById(readQuestionId);
		return readQues;
	}
	
	@RequestMapping(value="/deleteReadQuestion",method=RequestMethod.POST)
	public void deleteReadQuestion(Integer readQuestionId)	
	{
		readQuesDao.delete(readQuestionId);
	}
}
