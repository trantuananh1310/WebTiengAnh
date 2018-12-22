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
import dakt.javatech.jhibernate.dao.VocabularycontentDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Listenquestion;
import dakt.javatech.jhibernate.entity.Readquestion;
import dakt.javatech.jhibernate.entity.Vocabularycontent;
import dakt.javatech.jhibernate.entity.Vocabularyguideline;

@Controller
@EnableWebMvc
public class AdminVocabGuiContentController {

	@Autowired 
	LevelDao levelDao;
	
	@Autowired
	VocabularycontentDao vocabconDao;
	
	@RequestMapping(value="/AdminVocabularyContent", method=RequestMethod.GET)
	public ModelAndView listVocabContent(int vocabid)
	{
		List<Vocabularycontent> list = new ArrayList<Vocabularycontent>();
		list= vocabconDao.getListByLevelId(vocabid);
		ModelAndView modelView = new ModelAndView("admin/vocabulary_listen_admin/list_vocabularycontentadmin");
		modelView.addObject("vocabid",vocabid);
		modelView.addObject("listAdVocabCon", list);
		return modelView;
	}
	
	@RequestMapping(value="/addVocabularyContent", method=RequestMethod.GET)
	public ModelAndView addVocabularyContent(int vocabularyguidelineid)
	{
		ModelAndView modelView= new ModelAndView("admin/vocabulary_listen_admin/add_vocabulary_content");
		modelView.addObject("vocabularyguidelineid", vocabularyguidelineid);
		return modelView;
	}
	
	@RequestMapping(value="/editVocabularyContent", method=RequestMethod.GET)
	public ModelAndView editVocabularyContent(int vocabularyContentid,int vocabularyguidelineid)
	{
		Vocabularycontent item=vocabconDao.getById(vocabularyContentid);
		ModelAndView modelView= new ModelAndView("admin/vocabulary_listen_admin/edit_vocabulary");
		modelView.addObject("item", item);
		modelView.addObject("vocabularyguidelineid", vocabularyguidelineid);
		return modelView;
	}
	
	@RequestMapping(value="/deleteVocabularyContent",method=RequestMethod.POST)
	public void deleteVocabularyContent(Integer vocabularyContentId)	
	{
		vocabconDao.delete(vocabularyContentId);
	}
	
	@RequestMapping(value="/addVocabularyContent1", method=RequestMethod.POST)
	public ModelAndView AddVocabularyContent(Vocabularycontent vocabularyContent,@RequestParam(value = "file_picture") CommonsMultipartFile picture,
			@RequestParam(value = "file_mp3") CommonsMultipartFile fileMp3,HttpServletRequest request,ModelMap modelMap)
	{
		String image = picture.getOriginalFilename();
		String audiomp3= fileMp3.getOriginalFilename();
		vocabularyContent.setAudiomp3(audiomp3);
		vocabularyContent.setImage(image);
		String dirFile = request.getRealPath("images\\VocabContent");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			picture.transferTo(new File(fileDir + File.separator + image));
			System.out.println("Upload file th√†nh c√¥ng");
			modelMap.addAttribute("image", image);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String dirFile1 = request.getRealPath("Audio");
		System.out.println(dirFile1);
		File fileDir1 = new File(dirFile1);
		if (!fileDir1.exists()) {
			fileDir1.mkdir();
		}
		try {
			fileMp3.transferTo(new File(fileDir1 + File.separator + audiomp3));
			System.out.println("Upload file th√†nh c√¥ng");
			modelMap.addAttribute("audiomp3", audiomp3);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		vocabconDao.add(vocabularyContent);
		return new ModelAndView("redirect:/AdminVocabularyContent?vocabid="+vocabularyContent.getVocabularyguidelineid());
	}
	
	@RequestMapping(value="/editVocabularyContent", method=RequestMethod.POST)
	public ModelAndView EditVocabularyContent(Vocabularycontent vocabularycontent,@RequestParam(value = "file_picture") CommonsMultipartFile picture,
			@RequestParam(value = "file_mp3") CommonsMultipartFile fileMp3,HttpServletRequest request,ModelMap modelMap)
	{
		
		String image = picture.getOriginalFilename();
		String audiomp3= fileMp3.getOriginalFilename();
		if(!audiomp3.isEmpty())vocabularycontent.setAudiomp3(audiomp3);
		if(!image.isEmpty())vocabularycontent.setImage(image);
		String dirFile = request.getRealPath("images\\VocabContent");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			picture.transferTo(new File(fileDir + File.separator + image));
			System.out.println("Upload file th‡nh cÙng");
			modelMap.addAttribute("image", image);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String dirFile1 = request.getRealPath("Audio");
		System.out.println(dirFile1);
		File fileDir1 = new File(dirFile1);
		if (!fileDir1.exists()) {
			fileDir1.mkdir();
		}
		try {
			fileMp3.transferTo(new File(fileDir1 + File.separator + audiomp3));
			System.out.println("Upload file th‡nh cÙng");
			modelMap.addAttribute("audiomp3", audiomp3);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		vocabconDao.update(vocabularycontent);
		return new ModelAndView("redirect:/AdminVocabularyContent?vocabid="+vocabularycontent.getVocabularyguidelineid());
	}
}
