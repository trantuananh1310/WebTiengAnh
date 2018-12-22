package dakt.javatech.jhibernate.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
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
		modelView.addObject("examinationid", examinationid);
		return modelView;
	}
	@RequestMapping(value="/getListExamQuestionByPart",method=RequestMethod.GET)
	public ModelAndView getListExamQuestionByPart(String Part,String examinationid )
	{
		List<Examinationquestion> list= examquestionDao.getListByPart(Part, examinationid);
		if(Part.equals("2")){
			ModelAndView modelView= new ModelAndView("/admin/examinationquestion/list_examinationquestion_part2");
			modelView.addObject("list", list);
			return modelView;
		}
		else {
			ModelAndView modelView= new ModelAndView("/admin/examinationquestion/list_examinationquestion_part3");
			modelView.addObject("list", list);
			return modelView;
		}
		
	}
	@RequestMapping(value="/addExamQuestionExecl",method=RequestMethod.POST)
	public ModelAndView addExamQuestionExecl(@RequestParam(value = "execl") CommonsMultipartFile execl,@RequestParam(value = "image") CommonsMultipartFile[] image,
			@RequestParam(value = "filemp3") CommonsMultipartFile[] fileMp3,HttpServletRequest request,ModelMap modelMap,int examinationid) throws IOException
	{
		//upload
		try{
			InputStream in = execl.getInputStream();
		    File currDir = new File(".");
		    String path = currDir.getAbsolutePath();
		    String fileLocation = path.substring(0, path.length() - 1) + execl.getOriginalFilename();
		    FileOutputStream f = new FileOutputStream(fileLocation);
		    int ch = 0;
		    while ((ch = in.read()) != -1) {
		        f.write(ch);
		    }
		    f.flush();
		    f.close();	
		    FileInputStream inputStream = new FileInputStream(new File(fileLocation));
		    // Đối tượng workbook cho file XSL.
		      XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
		      // Lấy ra sheet đầu tiên từ workbook
		       XSSFSheet sheet = workbook.getSheetAt(0);
		    // Lấy ra Iterator cho tất cả các dòng của sheet hiện tại.
		       Iterator<Row> rowIterator = sheet.iterator();
		       int numberRow=0;
		       while (rowIterator.hasNext()) {
		    	   Row row = rowIterator.next();
		    	   if(numberRow==0){}
		    	   else
		    	   {
		    		   Iterator<Cell> cellIterator = row.cellIterator();
			           int i=0;
			           Examinationquestion item = new Examinationquestion();
			           while (cellIterator.hasNext()) {
			        	   Cell cell = cellIterator.next();
			        	   String value;
			        	   try{if( !cell.getStringCellValue().equals(".")) value=cell.getStringCellValue();
			        	   			else value=" ";
			        	   }
			        	   catch(Exception e)
			        	   {
			        		   value=String.valueOf(cell.getNumericCellValue());
			        	   }
				        	   if(i==0) item.setImagequestion(value); 
				        	   else if(i==1) item.setAudiomp3(value);
				        	   else if(i==2) item.setQuestion(value);
				        	   else if(i==3) item.setOption1(value);
				        	   else if(i==4) item.setOption2(value);
				        	   else if(i==5) item.setOption3(value);
				        	   else if(i==6) item.setOption4(value);
				        	   else if(i==7) item.setCorrectanswer(value);
				        	   else { 
				        		   String number=String.valueOf(value);
				        		   String[] array =number.split(".0");
				        		   item.setPart(array[0]);  
				        	   }
				        	   i++;
			           }
			           item.setExaminationid(examinationid);
			           examquestionDao.add(item);
		    	   }
		           numberRow++;
		     }
		      // up load list ảnh và video
		       for (CommonsMultipartFile item : image) {
		    	   uploadFile(item,"images\\examquestion",request,modelMap);
			}
		       for(CommonsMultipartFile item:fileMp3){
		    	   uploadFile(item,"Audio\\examquestion",request,modelMap);
		       }
			return new ModelAndView("redirect:/Examinationquestion?examinationid="+examinationid);
		}
		catch(Exception e)
		{
			return new ModelAndView("redirect:/errorAdmin");
		}
				
	}
	public void uploadFile(CommonsMultipartFile CommonsMultipartFile, String path,HttpServletRequest request,ModelMap modelMap)
	{
		String item = CommonsMultipartFile.getOriginalFilename();
		String dirFile = request.getRealPath(path);
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			CommonsMultipartFile.transferTo(new File(fileDir + File.separator + item));
			System.out.println("Upload file thÃ nh cÃ´ng");
			modelMap.addAttribute("item", item);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@RequestMapping(value="/editExaminationquestion",method=RequestMethod.GET)
	public ModelAndView editExaminationquestion(String examinationid,int examinationquestionid)
	{
		Examinationquestion item= examquestionDao.getById(examinationquestionid);
		ModelAndView modelView= new ModelAndView("/admin/examinationquestion/edit_examinationquestion");
		modelView.addObject("item", item);
		modelView.addObject("examinationid", examinationid);
		return modelView;
	}
	@RequestMapping(value="/editExaminationQuestion",method=RequestMethod.POST)
	public ModelAndView editExaminationquestionPOST(Examinationquestion examquestion,@RequestParam(value = "file_picture") CommonsMultipartFile picture,
			@RequestParam(value = "file_mp3") CommonsMultipartFile fileMp3,HttpServletRequest request,ModelMap modelMap)
	{
		String imagename = picture.getOriginalFilename();
		String audiomp3= fileMp3.getOriginalFilename();
		if(!audiomp3.isEmpty())examquestion.setAudiomp3(audiomp3);
		if(!imagename.isEmpty())examquestion.setImagequestion(imagename);
		String dirFile = request.getRealPath("images\\examinationquestion");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			picture.transferTo(new File(fileDir + File.separator + imagename));
			System.out.println("Upload file thÃ nh cÃ´ng");
			modelMap.addAttribute("imagename", imagename);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String dirFile1 = request.getRealPath("Audio\\examinationquestion");
		System.out.println(dirFile1);
		File fileDir1 = new File(dirFile1);
		if (!fileDir1.exists()) {
			fileDir1.mkdir();
		}
		try {
			fileMp3.transferTo(new File(fileDir1 + File.separator + audiomp3));
			System.out.println("Upload file thÃ nh cÃ´ng");
			modelMap.addAttribute("audiomp3", audiomp3);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		examquestionDao.update(examquestion);
		return new ModelAndView("redirect:/Examinationquestion?examinationid="+examquestion.getExaminationid());
	}
	@RequestMapping(value="/deleteExaminationQuestion",method=RequestMethod.POST)
	public @ResponseBody void deleteExaminationquestion(int examinationQuestionId)
	{
		examquestionDao.delete(examinationQuestionId);
	}

}
