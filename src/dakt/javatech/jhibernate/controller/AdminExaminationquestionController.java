package dakt.javatech.jhibernate.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.ExaminationquestionDao;
import dakt.javatech.jhibernate.entity.Examinationquestion;
import dakt.javatech.jhibernate.entity.Listenquestion;

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
			@RequestParam(value = "filemp3") CommonsMultipartFile[] fileMp3,HttpServletRequest request,ModelMap modelMap,int examinationid)
	{
		//upload
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
				           Listenquestion item = new Listenquestion();
				           while (cellIterator.hasNext()) {
				        	   Cell cell = cellIterator.next();
					        	   if(i==0) item.setImagename(cell.getStringCellValue()); 
					        	   else if(i==1) item.setAudiomp3(cell.getStringCellValue());
					        	   else if(i==2) item.setQuestion(cell.getStringCellValue());
					        	   else if(i==3) item.setOption1(cell.getStringCellValue());
					        	   else if(i==4) item.setOption2(cell.getStringCellValue());
					        	   else if(i==5) item.setOption3(cell.getStringCellValue());
					        	   else if(i==6) item.setOption4(cell.getStringCellValue());
					        	   else if(i==7) item.setCorrectanswer(cell.getStringCellValue());
					        	   else{ 
					        		   String number=String.valueOf(cell.getNumericCellValue());
					        		   String[] array =number.split(".0");
					        		   item.setListenexerciseid(Integer.parseInt(array[0]));  
					        	   }
					        	   i++;
				           }
				           listQuestionDao.add(item);
			    	   }
			           numberRow++;
			     }
			      // up load list ảnh và video
			       for (CommonsMultipartFile item : image) {
			    	   uploadFile(item,"images\\ListenQuestion",request,modelMap);
				}
			       for(CommonsMultipartFile item:fileMp3){
			    	   uploadFile(item,"Audio\\listenquestion",request,modelMap);
			       }
				return new ModelAndView("redirect:/AdminListListenQuestion?idListenExercis="+listenexerciseid);
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

}
