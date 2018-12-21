package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.ExaminationDao;
import dakt.javatech.jhibernate.entity.Examination;

@Controller
public class AdminExaminationController {
	@Autowired ExaminationDao examinationDao;
	@RequestMapping(value="/AdminExamination",method=RequestMethod.GET)
	public ModelAndView listExamination()
	{
		List<Examination> list= examinationDao.list();
		ModelAndView modelView= new ModelAndView("admin/examination/list_examination");
		modelView.addObject("list",list);
		return modelView;
	}
}
