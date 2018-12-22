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

import dakt.javatech.jhibernate.dao.ExaminationDao;
import dakt.javatech.jhibernate.dao.ExaminationquestionDao;
import dakt.javatech.jhibernate.entity.Examination;
import dakt.javatech.jhibernate.entity.Examinationquestion;
import dakt.javatech.jhibernate.entity.Listenexercise;

@Controller
public class AdminExaminationController {
	@Autowired ExaminationDao examinationDao;
	@Autowired ExaminationquestionDao examQuesDao;
	@RequestMapping(value="/AdminExamination",method=RequestMethod.GET)
	public ModelAndView AdminExamination()
	{
		List<Examination> list= examinationDao.list();
		ModelAndView modelView= new ModelAndView("admin/examination/list_examination");
		modelView.addObject("list",list);
		return modelView;
	}
	@RequestMapping(value="/addAndEditExamination", method=RequestMethod.POST)
	public ModelAndView addAndEditExamination(String examinationame, String examinationidd, @RequestParam(value = "file") CommonsMultipartFile commonsMultipartFiles,
			ModelMap modelMap,HttpServletRequest request)
	{
		String nameFile = commonsMultipartFiles.getOriginalFilename();
		if(!examinationidd.isEmpty() &&examinationidd!=null  ) {
			Examination exam = new Examination();
			exam = examinationDao.getById(Integer.parseInt(examinationidd));
			exam.setExaminatioimage(nameFile);
			exam.setExaminationame(examinationame);
			examinationDao.update(exam);
		}
		else {
			Examination examm = new Examination();
			examm.setExaminationame(examinationame);
			examm.setExaminatioimage(nameFile);
			
			examinationDao.add(examm);
		}
		String dirFile = request.getRealPath("images\\examination");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			commonsMultipartFiles.transferTo(new File(fileDir + File.separator + nameFile));
			System.out.println("Upload file thành công");
			modelMap.addAttribute("filename", nameFile);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Upload file thất bại");
		}
		ModelAndView modelView= new ModelAndView("redirect:/AdminExamination");
		return modelView;
	}
	
	@RequestMapping(value="/editExamination",method=RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody Examination editExamination(Integer examinationId)	
	{
		Examination exam = new Examination();
		exam = examinationDao.getById(examinationId);
		return exam;
	}
	
	@RequestMapping(value="/deleteExamination",method=RequestMethod.POST)
	public void deleteExamination(Integer examinationId)	
	{
		List<Examinationquestion> lstExam = new ArrayList<>();
		lstExam = examQuesDao.getListByExaminationId(examinationId);
		if(lstExam!=null || lstExam.size()!=0) {
			for (Examinationquestion examinationquestion : lstExam) {
				examQuesDao.delete(examinationquestion.getExaminationquestionid());
			}
		}
		examinationDao.delete(examinationId);
	}
//	@RequestMapping(value="/deleteExamination",method=RequestMethod.POST)
//	public void deleteExamination(Integer examinationId)	
//	{
//		examinationDao.delete(examinationId);
//	}
}
