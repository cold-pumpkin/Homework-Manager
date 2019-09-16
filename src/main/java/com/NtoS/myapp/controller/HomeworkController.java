package com.NtoS.myapp.controller;

import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NtoS.myapp.model.HomeworkVO;
import com.NtoS.myapp.model.MemberVO;
import com.NtoS.myapp.service.IProjectService;

@Controller
public class HomeworkController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeworkController.class);
		
	@Autowired
	IProjectService projectService;
	
	//이 매핑은 메인 달력 화면에서 날짜 정하고 제출하기 버튼을 누를경우 개인 페이지를 보여주는 것 
	@RequestMapping(value = "/mypage", method=RequestMethod.GET)
	public String myListPage(HomeworkVO homework, HttpSession session,
			HttpServletResponse response,HttpServletRequest request, Model model) {

		//제출 일자를 선택받아서 넘어오므로 날짜를 받는다
		// submitDate=request.getParameter("submitDate");
		//System.out.println("넘어온 홈워크 커맨드 객체의 값: "+homework);
		//우선 개인 페이지이므로, 세션값을 확인한다
		MemberVO login = (MemberVO)session.getAttribute("login");   
		Date submitDate = (Date)session.getAttribute("submitDate");
		System.out.println("세션 객체의 값은?"+login);// request에서 id 파라미터를 가져온다
		try {
		if(login==null){//세션값이 없다면
			System.out.println("홈웤 컨트롤러 세션 확인 왔는지 확인용");
		response.sendRedirect("login");    // 로그인 페이지로 리다이렉트 한다. login

		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("(현재 세션 통과)이제 페이지 이동");
		String email = login.getEmail();
		System.out.println(email);
		System.out.println(homework);
		System.out.println((String)request.getParameter("submitDate"));
		//리다이렉트 한경우, 벨류오브 함수안에 null같이 들어가서 에러가 난다. 그러므로
		//Date submitDate=null;
		if(request.getParameter("submitDate")==null) {//리다이렉트 한경우, sbR을 넣고
			//submitDate=Date.valueOf(submitDate);
			System.out.println("submitDate가 널인경우 리다이렉트 값을 받아 넣음:"+submitDate);
		}else {//아닌 경우에, 그냥 평범하게 받는다
			submitDate= Date.valueOf((String)request.getParameter("submitDate"));
		}
		System.out.println(submitDate);
		homework.setSubmitDate(submitDate);
		System.out.println(homework.toString());
		HomeworkVO al = projectService.getAlSubmit(email, submitDate);
		//이메일이랑 제출일을 기준으로 가져와서 알마인드 객체를 만듬
		if(al==null){
			HomeworkVO dummy = new HomeworkVO();
			dummy.setFileId(0);
			al=dummy;
		}
		HomeworkVO news = projectService.getNewsSubmit(email, submitDate);
		if(news==null) {
			HomeworkVO dummy = new HomeworkVO();
			dummy.setFileId(0);
			news=dummy;
		}
		HomeworkVO walk = projectService.getWalkSubmit(email, submitDate);
		if(walk==null) {
			HomeworkVO dummy = new HomeworkVO();
			dummy.setFileId(0);
			walk=dummy;
		}
		model.addAttribute("al", al);
		model.addAttribute("news", news);
		model.addAttribute("walk", walk);
		/*System.out.println(al.toString());
		System.out.println(news.toString());
		System.out.println(walk.toString());*/
		//세션값이 있다면, 그에 맞는 페이지로 이동시킨다.
	//	redirectAttributes.addFlashAttribute("submitDateR",submitDate);
		return "mymy/mypage";
	}

	//업로드 버튼 클릭시에 실행되는 매소드 (3가지 과제 모두 같은 메소드로 업로드됨)
	//수정도 같이 처리된다. 수정은 사실 업로드와 삭제를 할 뿐이니까
	@RequestMapping(value="/mypage/upload", method=RequestMethod.POST)
	public String uploadFile( @RequestParam(value = "submitDateR" , defaultValue = "2018-03-01") String submitDateR,
			HttpSession session, HomeworkVO homework,Model model,
			@RequestParam MultipartFile file, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		MemberVO member=(MemberVO)session.getAttribute("login");
		
		System.out.println("업로드 시작시 받은 커멘드 객체 member: "+member);
		System.out.println("받는 커멘드 객체의 값: "+request.getParameter("command"));
		System.out.println("제출시 받은 파일 아이디값: "+request.getParameter("deleteFileId"));
		logger.info(file.getOriginalFilename());
		Date submitDate=Date.valueOf((String)request.getParameter("submitDate"));
		if(request.getParameter("submitDate")==null) {//리다이렉트 한경우, sbR을 넣고
			submitDate=Date.valueOf(submitDateR);
			System.out.println("(업로드)submitDate가 널인경우 리다이렉트 값을 받아 넣음:"+submitDate);
		}else {//아닌 경우에, 그냥 평범하게 받는다
			submitDate=Date.valueOf((String)request.getParameter("submitDate"));
		}
		System.out.println("제출시 컨트롤러의 submitdate"+submitDate);
				//System.out.println("업로드시 실행되는 homework 객체의 들어간 값:"+homework);
		if(request.getParameter("command")!=null) {//수정 버튼을 누를경우만 command에 update값을 가지므로, 
			//이날의 자료를 삭제한뒤 업로드 처리를 한다
			projectService.deleteFile(Integer.parseInt((String)request.getParameter("deleteFileId")));
		}
		try{
			if(file!=null && !file.isEmpty()) {//파일이 있다면 실행
				logger.info("/upload : " + file.getOriginalFilename());
				
				
				homework.setFileName(file.getOriginalFilename());
				homework.setFileSize(file.getSize());
				homework.setFileContentType(file.getContentType());
				homework.setFileData(file.getBytes());
				homework.setEmail(member.getEmail());
				homework.setSubmitDate(submitDate);
			// 이건 제목짜기 함수인데 어디 넣을때가 마땅치 않아서 그냥 여기서 처리해버린다.
			// [강민웅] 2018년 2월 5일자 알마인드 제출
			
			//	
				String title="";
				if(homework.getDirectoryName().equals("알마인드")) {
					//폼에서 입력받은 directoryName 같은 이미 입력되었을 것이므로
					
					title="["+member.getMemberName()+"] "+submitDate+homework.getDirectoryName()+"제출";
					
					//System.out.println(title);
					
				}else if(homework.getDirectoryName().equals("사설")) {
//					[강민웅] 신문사설 1일차(2/26)
				//날짜 쪼개기 함수
					String[] txtArr = ((String)request.getParameter("submitDate")).split("-") ;
			         
			        System.out.println("[split 이용]") ;
			        for(int i=0; i < txtArr.length; i++){
			            System.out.println(txtArr[i]) ;
			        }
			        //사설 XX일차 계산 함수 4.2일 이 24일차였으며
			        //4.9일 29일차, 임 
			        String start = "2018-04-02";
			        
			         
			        try {
			            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			            Date beginDate = (Date) formatter.parse(start);
			            Date endDate = homework.getSubmitDate();
			             
			            // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
			            long diff = endDate.getTime() - beginDate.getTime();
			            long diffDays = diff / (24 * 60 * 60 * 1000);
			     
			            System.out.println("날짜차이=" + diffDays);
			             
			        } catch (ParseException e) {
			            e.printStackTrace();
			        }


			      //  int cal=projectService.calculateDif(homework);//오늘과 기준일의 차이를 계산하여 알려준다
			        for(int x=24;x<100;x++) {
			        	//4.2일과 오늘의 차이 값인 cal을 기준으로 값%7 =1~5, 
			        	//12345일까지는 +1씩 일자를 더하고, 
			        	//값 %67일은 +0을 반복한다 그리고 그 날자의 경우 오늘은 휴일임을 알려주자
			        }
			        String cals=" ";
					title="["+member.getMemberName()+"] "+"신문사설 "+cals+"일차"+"("+txtArr[1]+"/"+txtArr[2]+")";
				}
				else {
					String[] txtArr = ((String)request.getParameter("submitDate")).split("-") ;
			         
			        System.out.println("[split 이용]") ;
			        for(int i=0; i < txtArr.length; i++){
			            System.out.println(txtArr[i]) ;
			        }
			        //사설 XX일차 계산 함수 4.2일 이 24일차였으며
			        //4.9일 29일차, 임 
			        //[강민웅] 만보 1일차(2/26)
			        String start = "2018-04-02";
			        title="["+member.getMemberName()+"] "+"만보 "+" 일차"+"("+txtArr[1]+"/"+txtArr[2]+")";
				}
				homework.setHomeworkTitle(title);
				
				//logger.info("/upload : " + homework.toString());
				/////////////////////////이까지 업로드할 파일 정보를 객체에 담는다//////////
				model.addAttribute("submitDate",submitDate);
				projectService.uploadFile(homework);//그 객체를 넘겨준다
			}
		}catch(Exception e){
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		System.out.println("업로드 처리 완료 이제 /mypage로 간다");

		System.out.println(submitDate);
		session.setAttribute("submitDate", submitDate);
		System.out.println(submitDate);
		
		return "redirect:/mypage";//
		//return "mymy/mypage";
	}
	
	@RequestMapping(value="/mypage/delete/{fileId}")
	public String deleteFile(@PathVariable int fileId, HttpSession session,HttpServletRequest request)
	{
		System.out.println("삭제에 도착!!");
		session.getAttribute("submitDate");
		projectService.deleteFile(fileId);
		System.out.println("삭제 완료 이제 페이지이동");
		return "redirect:/mypage";
	}
	
	

	@RequestMapping("/pds/{fileId}")
	public ResponseEntity<byte[]> getBinaryFile(@PathVariable int fileId, HttpSession session) {
		HomeworkVO file = projectService.getFile(fileId);
		final HttpHeaders headers = new HttpHeaders();
		if(file != null) {
			logger.info("getFile " + file.toString());
			String[] mtypes = file.getFileContentType().split("/");
			headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
			headers.setContentDispositionFormData("attachment", file.getFileName(), Charset.forName("UTF-8")); //4.3.7 이후 charset 지정 가능
			headers.setContentLength(file.getFileSize());
			return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
		}else {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
	}
	
}
