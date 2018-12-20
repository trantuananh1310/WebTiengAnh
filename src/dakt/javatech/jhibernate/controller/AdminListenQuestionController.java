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

import dakt.javatech.jhibernate.dao.ListenquestionDao;
import dakt.javatech.jhibernate.entity.Listenquestion;

@Controller
@EnableWebMvc
public class AdminListenQuestionController {
	@Autowired ListenquestionDao listQuestionDao;
	@RequestMapping(value="/AdminListListenQuestion", method=RequestMethod.GET)
	public ModelAndView listListenQuestion(int idListenExercis)
	{
		List<Listenquestion> list = new ArrayList<Listenquestion>();
		list= listQuestionDao.getListByListenExerciseId(idListenExercis);
		ModelAndView modelView = new ModelAndView("admin/listen_exercise/list_listenQuestion");
		modelView.addObject("idListenExercis",idListenExercis);
		modelView.addObject("listQuestion", list);
		return modelView;
	}
	@RequestMapping(value="/addListenQuestion", method=RequestMethod.GET)
	public ModelAndView addQuestion(int listenexerciseid)
	{
		ModelAndView modelView= new ModelAndView("admin/listen_exercise/add_listenquestion");
		modelView.addObject("listenexerciseid", listenexerciseid);
		return modelView;
	}
	@RequestMapping(value="/editListenQuestion", method=RequestMethod.GET)
	public ModelAndView editListenQuestion(int listenQuestionid,int listenexerciseid)
	{
		Listenquestion item=listQuestionDao.getById(listenQuestionid);
		ModelAndView modelView= new ModelAndView("admin/listen_exercise/edit_question");
		modelView.addObject("item", item);
		modelView.addObject("listenexerciseid", listenexerciseid);
		return modelView;
	}
	@RequestMapping(value="/deleteListenQuestion", method=RequestMethod.POST)
	public  @ResponseBody void deleteListenQuestion(int listenQuestionId)
	{
		listQuestionDao.delete(listenQuestionId);
	}
	@RequestMapping(value="/addListenQuestion1", method=RequestMethod.POST)
	public ModelAndView AddListenQuestion(Listenquestion listenQuestion,@RequestParam(value = "file_picture") CommonsMultipartFile picture,
			@RequestParam(value = "file_picture") CommonsMultipartFile fileMp3,HttpServletRequest request,ModelMap modelMap)
	{
		String imagename = picture.getOriginalFilename();
		String audiomp3= fileMp3.getOriginalFilename();
		listenQuestion.setAudiomp3(audiomp3);
		listenQuestion.setImagename(imagename);
		String dirFile = request.getRealPath("images\\listenexercises");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			picture.transferTo(new File(fileDir + File.separator + imagename));
			System.out.println("Upload file thành công");
			modelMap.addAttribute("imagename", imagename);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String dirFile1 = request.getRealPath("Audio\\listenexercises");
		System.out.println(dirFile1);
		File fileDir1 = new File(dirFile1);
		if (!fileDir1.exists()) {
			fileDir1.mkdir();
		}
		try {
			fileMp3.transferTo(new File(fileDir1 + File.separator + audiomp3));
			System.out.println("Upload file thành công");
			modelMap.addAttribute("audiomp3", audiomp3);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		listQuestionDao.add(listenQuestion);
		return new ModelAndView("redirect:/AdminListListenQuestion?idListenExercis="+listenQuestion.getListenexerciseid());
	}
}
