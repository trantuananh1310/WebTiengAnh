package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.ExaminationquestionDao;
import dakt.javatech.jhibernate.entity.Examinationquestion;

@Controller
public class AdminExaminationquestionController {
	
	@Autowired ExaminationquestionDao examquestionDao;
	@RequestMapping(value="/Examinationquestion",method=RequestMethod.GET)
	public ModelAndView Examinationquestion(String examinationid)
	{
		List<Examinationquestion> list= examquestionDao.getListByPart("1", examinationid);
		List<String> listPart=examquestionDao.getListPart();
		ModelAndView modelView= new ModelAndView("/admin/examinationquestion/list_examinationquestion");
		modelView.addObject("list", list);
		modelView.addObject("listPart", listPart);
		return modelView;
	}
}
