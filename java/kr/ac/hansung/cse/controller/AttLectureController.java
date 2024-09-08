package kr.ac.hansung.cse.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.hansung.cse.model.AttLecture;
import kr.ac.hansung.cse.service.AttLectureService;
//스프링에게 자세한 정보를 주기 위해 @Component가 아닌 @Controller, @Service, @Repository를 사용한다. 
@Controller
public class AttLectureController {
	@Autowired
	public AttLectureService attLectureService;

	// 학기별 수강 리스트를 보여준다.
	@RequestMapping("/viewLecture")
	public String showLectureList(HttpServletRequest request, Model model) {
		int year = Integer.parseInt(request.getParameter("year"));
		int term = Integer.parseInt(request.getParameter("term"));
		List<AttLecture> lectures = attLectureService.getLectureByYT(year, term);
		model.addAttribute("lectures", lectures);

		return "viewLecture";
	}
	// 학기별 수강 리스트를 보기 위한 페이지로 이동한다.
	@RequestMapping("/attLecture")
	public String showLecture(HttpServletRequest request, Model model) {
		List<AttLecture> lectures = attLectureService.getLecture();
		model.addAttribute("lectures", lectures);

		return "attLecture";
	}

	// 2024년 2학기 수강 리스트를 보여준다.
	@RequestMapping("/viewRegisterLecture")
	public String showRegistLectures(Model model) {
		

		List<AttLecture> lectures2024 = attLectureService.getLectureByYT(2024, 2);

		
		model.addAttribute("lectures2024", lectures2024);

		return "viewRegisterLecture";
	}
	//수강신청을 하는 페이지로 이동한다.
	@RequestMapping("/registerLecture")
	public String createoffer(Model model) {
		AttLecture attlecture=new AttLecture(); // docreate는 데이터바인딩을 할 때 자동적으로 Model에 들어가므로 직접 넣어주지 않아도 되지만 여기서는 넣어줘야 한다.
		model.addAttribute(attlecture);        //model의 이름은 attLecture이다. model의 이름을 명시해주지 않았을 시에 자동 생성된다.
		return "registerLecture";
	}

@RequestMapping("docreate")
public String doCreate(Model model,@Valid AttLecture lecture,BindingResult result) {

	if(result.hasErrors()) {
		System.out.println("웹 폼데이터가 유효하지 않습니다.");
		List<ObjectError> errors= result.getAllErrors();
	
		for(ObjectError error: errors)
		{
		System.out.println(error.getDefaultMessage());	
			
		}


		// 에러가 뜨면 다시 페이지로 이동한다.
		return "registerLecture";
	
}
   System.out.println(lecture);
// 에러가 없는 경우에 controller는 service를 호출하고 service는 dao를 호출한다.
	attLectureService.insert(lecture);
   return "modelCreate";
}
}