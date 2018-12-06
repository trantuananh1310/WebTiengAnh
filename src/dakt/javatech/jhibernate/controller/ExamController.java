package dakt.javatech.jhibernate.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.ExaminationDao;
import dakt.javatech.jhibernate.dao.ExaminationquestionDao;
import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.entity.AnswerUser;
import dakt.javatech.jhibernate.entity.Examination;
import dakt.javatech.jhibernate.entity.Examinationquestion;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.ListenGuideline;

@Controller
public class ExamController {
	@Autowired
	LevelDao levelDao;

	@Autowired
	ExaminationquestionDao examinationquestionDAO;
	@Autowired
	ExaminationDao examinationDao;
	@RequestMapping(value="/Exam", method=RequestMethod.GET)
	public  ModelAndView Exam(int stt)
	{
		
		List<Level> lstLevel=levelDao.list();
		List<Examinationquestion>  list= examinationquestionDAO.getListByExaminationId(26);
		int totalQuestion= list.size();
		ModelAndView modelView = new ModelAndView("/Exam");
		modelView.addObject("lstLevel", lstLevel);
		modelView.addObject("listQuestion",  list);
		modelView.addObject("totalQuestion",totalQuestion);
		modelView.addObject("Question", list.get(stt-1));
		modelView.addObject("stt", stt);
		return modelView;
	}
	@RequestMapping(value="/ExamQuestion", method=RequestMethod.GET)
	public ModelAndView getQuestionByStt(int stt,String examinationId)
	{
		List<Examinationquestion>  list= examinationquestionDAO.getListByExaminationId(Integer.parseInt(examinationId));
		ModelAndView modelView = new ModelAndView("/ExamQuestion");
		modelView.addObject("listQuestion",  list);
		modelView.addObject("Question", list.get(stt-1));
		modelView.addObject("stt", stt);
		modelView.addObject("part",list.get(stt-1).getPart());
		return modelView;
	}
	@RequestMapping(value="/ExamQuestionByPart", method=RequestMethod.GET)
	public ModelAndView getQuestionByPart(String part,String examinationId)
	{
		List<Examinationquestion>  list= examinationquestionDAO.getListByExaminationId(Integer.parseInt(examinationId));
		int stt=0;
		// tìm vị trí của câu hỏi đầu tiên thỏa mãn đk 
		for (Examinationquestion item : list) {
			stt++;
			if(item.getPart()==part) break;
		};
		ModelAndView modelView = new ModelAndView("/exam_question_part");
		modelView.addObject("listQuestion",  list);
		modelView.addObject("Question", list.get(stt-1));
		modelView.addObject("stt", stt);
		modelView.addObject("part",list.get(stt-1).getPart());
		return modelView;
	}
	@RequestMapping(value="/NopBai", method=RequestMethod.POST)
	@ResponseBody
	public String checkQuestion(HttpServletRequest request)
	{
		List<Examinationquestion> list = examinationquestionDAO.getListByExaminationId(26);
		int countRow = list.size();
		int soCauDung=0;
		for( int i=0;i<countRow;i++)
		{
			String answer = request.getParameter("question["+i+"]");
			if(answer!=null){
//				AnswerUser au= new AnswerUser();
//				au.setNumber(list.get(i).getExaminationquestionid());
//				au.setAnswer(answer);
				if(list.get(i).getCorrectanswer().equals(answer))
				{
					soCauDung++;
				}
			}
		}
		return String.valueOf(soCauDung);
	}
	@RequestMapping(value="/TestExam", method=RequestMethod.GET)
	public ModelAndView getQuestionByStt2(int stt)
	{	// lấy list các đề thi
		List<Examination> listExam = examinationDao.list();
		// lấy ramdom 1 đề trong list các dề thi
		Random rn = new Random();
        int randomNum =rn.nextInt(listExam.size());
        int examinationId = listExam.get(randomNum).getExaminationid();
		// lấy các câu hỏi của đề thi
		List<Examinationquestion>  list= examinationquestionDAO.getListByExaminationId(examinationId);
		ModelAndView modelView = new ModelAndView("/TestExam");
		modelView.addObject("listQuestion",  list);
		modelView.addObject("Question", list.get(stt-1));
		modelView.addObject("stt", stt);
		modelView.addObject ("examinationId",examinationId);
		modelView.addObject("part",list.get(stt-1).getPart());
		return modelView;
	}


}
