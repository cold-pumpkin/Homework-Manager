package com.NtoS.myapp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.Port;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.NtoS.myapp.model.BoardVO;
import com.NtoS.myapp.model.MemberVO;
import com.NtoS.myapp.service.IProjectService;

@Controller
public class BoardController {
	@Autowired
	IProjectService projectService;

	/*//글 작성 페이지로 보내기
	@RequestMapping(value="/boardView/write_form", method=RequestMethod.GET)
	public String signUp() {

		return "boardView/write_form";
	}

	//글 작성 처리
	@RequestMapping(value="/boardView/write_form", method=RequestMethod.POST)
	public String signUp(BoardVO writing, HttpSession session, Model model) {
		projectService.insertWriting(writing);
		return "boardView/write_list";	//글 리스트로 가기
	}*/


	@RequestMapping(value = "/communityBoardList")
	public String boardList(ModelMap modelMap,HttpSession session,Model model) {
		List<?> listview   = projectService.selectBoardList();

		modelMap.addAttribute("listview", listview);
		return "boardView/boardList";
	}
	@RequestMapping(value = "/qandABoardList")
	public String qandAboardList(ModelMap modelMap,HttpSession session,Model model) {
		List<?> listview   = projectService.selectBoardList();

		modelMap.addAttribute("listview", listview);
		return "boardView/boardList";
	}
	//리스트 뷰에서 글쓰기 버튼 클릭시 글쓰기 폼 보여주기
	@RequestMapping(value = "/communityBoardForm")
	public String boardForm(MemberVO member,HttpSession session,Model model){
		//인증 처리부분

		member=(MemberVO)session.getAttribute("login");
		System.out.println("글쓰기 폼에 넘기는 콘트럴러의 세션객체값 확인: "+member);
		if(projectService.getMemberInfo(member.getEmail(), member.getPassword()) == null) {
			//폼에서 입력받은, 이메일과, 아이디값이 같은지 db에서 같다는 결과가 나오지 않는경우
			return "redirect: /login";//다시 로긴 폼 페이지로
		}else {
			model.addAttribute("member1",member);
			System.out.println("모델의 값 출력:"+model);
			return "boardView/boardForm";
		}
	}
	//글쓰기 폼에서 저장을 누르면 저장되고 보드 리스트로 가기
	@RequestMapping(value = "/communityBoardSave")
	public String boardSave(@ModelAttribute BoardVO boardInfo){

		projectService.insertCommunityBoard(boardInfo);

		return "redirect:/communityBoardList";
	}

	//제목을 클릭한 경우, 글번호를 파라미터로 받은뒤 그것을 기준으로 디비의 정보를 얻고,
	//글 상세내용이 보이는 페이지로 가는 컨트롤러
	@RequestMapping(value = "/communityBoardRead")
	public String boardRead(HttpServletRequest request, ModelMap modelMap) {

		String brdno = request.getParameter("brdno");
		 projectService.updateBoard2Read(Integer.parseInt(brdno));//읽을때마다 조회수 증가함수
		BoardVO boardInfo = projectService.selectCommunityBoard(Integer.parseInt(brdno));
		//
		System.out.println(boardInfo);
		modelMap.addAttribute("boardInfo", boardInfo);

		return "boardView/boardRead";
	}
	//글 상세조회시 수정버튼을 누른경우, 수정 폼으로 가는 컨트롤러이다 그럴려면 이 페이지 정보를 다시읽어와야지
	@RequestMapping(value = "/communityBoardUpdate")
	public String boardUpdate(MemberVO member, HttpSession session,HttpServletRequest request, 
			ModelMap modelMap){
		String brdno = request.getParameter("brdno");
		BoardVO boardInfo = projectService.selectCommunityBoard(Integer.parseInt(brdno));

		member=(MemberVO)session.getAttribute("login");
		/*System.out.println("업데이트시 콘트럴러의 세션객체값 확인: "+member);
		System.out.println("현재 글의 작성자 이메일 확인:"+boardInfo);*/
		if(member.getEmail().equals(boardInfo.getBrdwriter())) {//글의 수정 삭제는 작성자 이메일과, 세션객체 값이 같아야만 가능하므로!!!
			//검증 통과시만 
			modelMap.addAttribute("boardInfo", boardInfo);

			return "boardView/boardUpdate";
			
		}else {
			//폼에서 입력받은, 이메일과, 아이디값이 같은지 db에서 같다는 결과가 나오지 않는경우
			return "boardView/noGrantErrorView";//다시 글 조회 페이지로
		}
	}
	//수정 폼에서 수정 제출시 업데이트 처리후 다시 리스트로 가는 컨트롤러
	@RequestMapping(value = "/communityBoardUpdateSave")
	public String board1UpdateSave(@ModelAttribute("boardInfo") BoardVO boardInfo){
	        
	        projectService.updateCommunityBoard(boardInfo);
	        
	        return "redirect:/communityBoardList";
	}

	//삭제버튼 누르면 brno받고 그걸기준으로 삭제처리후 리스트로
	@RequestMapping(value = "/communityBoardDelete")
    public String boardDelete(MemberVO member, HttpSession session,HttpServletRequest request, 
			ModelMap modelMap) throws Exception {
		String brdno = request.getParameter("brdno");
		BoardVO boardInfo = projectService.selectCommunityBoard(Integer.parseInt(brdno));

		member=(MemberVO)session.getAttribute("login");
		/*System.out.println("업데이트시 콘트럴러의 세션객체값 확인: "+member);
		System.out.println("현재 글의 작성자 이메일 확인:"+boardInfo);*/
		if(member.getEmail().equals(boardInfo.getBrdwriter())) {//글의 수정 삭제는 작성자 이메일과, 세션객체 값이 같아야만 가능하므로!!!
			//검증 통과시만   
			projectService.deleteCommunityBoard(Integer.parseInt(brdno));

			return "redirect:/communityBoardList";
			
		}else {
			//폼에서 입력받은, 이메일과, 아이디값이 같은지 db에서 같다는 결과가 나오지 않는경우
			return "boardView/noGrantErrorView";//다시 글 조회 페이지로
		}
	}
		@RequestMapping(value = "/board2Read")
		public String boardSave(HttpServletRequest request, ModelMap modelMap) throws Exception {
		    String brdno = request.getParameter("brdno");
		        
		   
		    BoardVO boardInfo = projectService.selectCommunityBoard(Integer.parseInt(brdno));
		    modelMap.addAttribute("boardInfo", boardInfo);
		        
		    return "board2/boardRead";
		}

     
   
     
     
}





















