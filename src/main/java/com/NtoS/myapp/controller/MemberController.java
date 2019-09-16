package com.NtoS.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.NtoS.myapp.model.HomeworkVO;
import com.NtoS.myapp.model.MemberVO;
import com.NtoS.myapp.service.IProjectService;

@Controller
public class MemberController {
	@Autowired
	IProjectService projectService;


	//로그인 폼을 요청하는 부분이다
	@RequestMapping(value="/login", method=RequestMethod.GET )
	public String login() {

		return "login";
	}

	//로그인 확인 하고 다시 로긴폼으로 보내거나, 메인 페이지로 가게만드는 부분
	@RequestMapping(value="/login", method=RequestMethod.POST )
	public String loginCheck(MemberVO member, HttpSession session, Model model) {
		//System.out.println(model);
		if ( session.getAttribute("login") != null ){
			// 기존에 member이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}
		System.out.println("호출함수의 객체값: "+projectService.getMemberInfo(member.getEmail(), member.getPassword()));
		if(projectService.getMemberInfo(member.getEmail(), member.getPassword()) == null) {
			//폼에서 입력받은, 이메일과, 아이디값이 같은지 db에서 같다는 결과가 나오지 않는경우
			return "redirect: /login";//다시 로긴 폼 페이지로
		}else {
			session.setAttribute("login", 
					(MemberVO)projectService.getMemberInfo(member.getEmail(), member.getPassword()));
			System.out.println("세션 설정 후 세션의 값: "+session.getAttribute("login"));
			String email = member.getEmail();

			List<HomeworkVO> allist =projectService.getAlList(email);
			List<HomeworkVO> newslist =projectService.getNewsList(email);
			List<HomeworkVO> walklist =projectService.getWalkList(email);
			if(walklist.isEmpty()==true) {//walklist가 없으면 아예 객체 생성이 안되어버리므로 만들어준다
				System.out.println("하나도 없는 경우 워크리스트는 isEmpty?");
				HomeworkVO e=new HomeworkVO();
				e.setFileId(0);//파일아이디가 0인놈으로 하나 만들어줌
				walklist.add(e);
				//System.out.println(walklist);
			}
			model.addAttribute("allist", allist);
			model.addAttribute("newslist", newslist);
			model.addAttribute("walklist", walklist);
			//System.out.println(allist.toString());
			//System.out.println(model);
			return "mymy/default";
		}

	}
	//홈버튼이 default 으로 가는 거니까 거기로 가는 함수 하나 만들어야함
	@RequestMapping(value="/main")
	public String goMain(MemberVO member, HttpSession session, Model model) {
		
		if(session.getAttribute("login")== null) {
			//폼에서 입력받은, 이메일과, 아이디값이 같은지 db에서 같다는 결과가 나오지 않는경우
			return "redirect: /login";//다시 로긴 폼 페이지로
		}else {
			
					
			member=(MemberVO)session.getAttribute("login");
			List<HomeworkVO> allist =projectService.getAlList(member.getEmail());
			List<HomeworkVO> newslist =projectService.getNewsList(member.getEmail());
			List<HomeworkVO> walklist =projectService.getWalkList(member.getEmail());
			if(walklist.isEmpty()==true) {//walklist가 없으면 아예 객체 생성이 안되어버리므로 만들어준다
				System.out.println("하나도 없는 경우 워크리스트는 isEmpty?");
				HomeworkVO e=new HomeworkVO();
				e.setFileId(0);//파일아이디가 0인놈으로 하나 만들어줌
				walklist.add(e);
				//System.out.println(walklist);
			}
			model.addAttribute("allist", allist);
			model.addAttribute("newslist", newslist);
			model.addAttribute("walklist", walklist);
			//System.out.println(allist.toString());
			return "mymy/default";
		}
	}


	//회원 등록 페이지로 보내기
	@RequestMapping(value="/memberView/sign_up", method=RequestMethod.GET)
	public String signUp() {

		return "memberView/sign_up";
	}

	//회원 등록 처리하기
	@RequestMapping(value="/memberView/sign_up", method=RequestMethod.POST)
	public String signUp(MemberVO member, HttpSession session, Model model) {

		//System.out.println(model);
		if(projectService.getMemberInfo(member.getEmail(), member.getPassword()) != null) {
			return "memberView/sign_up";
			//	         return "mymy/default";
		}else {
			projectService.insertMember(member);
			session.setAttribute("member", model);
			return "redirect: /login";
		}
	}

	//회원 정보 페이지 가기
	@RequestMapping(value="/memberView/member_info")
	public String selectMemberInfo(HttpSession session) {
		MemberVO mem = (MemberVO)session.getAttribute("login");
		System.out.println("주소맞냐");
		System.out.println(mem.getEmail());
		return "memberView/member_info";
	}

	//로그아웃 페이지 가기
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		System.out.println(session.getAttribute("member"));
		session.invalidate();
		//System.out.println("세션 종료 됐냐 : " + session.getAttribute("member"));
		return "login";
	}
	//멤버 상세조회 페이지니까, 가기전에 자기 값을 담아서 가야함
	@RequestMapping(value="/member_info")
	public String memberDetails(MemberVO member,HttpSession session,Model model) {
		
		MemberVO login=(MemberVO)session.getAttribute("login");
		model.addAttribute("member1",login);
		
		return "memberView/member_info";
	}
	
	//멤버 수정하기 1. 우선 수정 폼으로 간다
	@RequestMapping(value="/memberUpdateForm")
	public String memberUpdateForm(MemberVO member,HttpSession session,Model model) {
		MemberVO login=(MemberVO)session.getAttribute("login");
		System.out.println(login);
		model.addAttribute("member1",login);
		return "memberView/update_member_info";
	}
	//수정하기2. 수정폼에서 입력값을 받아 업데이트 한다 그리고 멤버 인포 페이지로 간다
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(MemberVO member,HttpSession session,Model model) {
		MemberVO login=(MemberVO)session.getAttribute("login");
		projectService.updateMember(member);
		session.removeAttribute("login");
		session.setAttribute("login", member);
		model.addAttribute("member1", member);
		return "/memberView/member_info";
	}
}
