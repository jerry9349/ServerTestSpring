package com.you.joo.controller.member;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.you.joo.model.dto.MemberDTO;
import com.you.joo.service.member.MemberService;

@RestController
@RequestMapping("member/*") //怨듯넻�쟻�씤 url 留ㅽ븨	
public class MemberController {
	/*@RestController는 Controller와 다르게 리턴값에 자동으로 @ResponseBody를 
		붙이게 되어 HTTP 응답데이터(body)에 자바 객체가 매핑되어 전달된다.
		그냥 @Controller인 경우에 데이터를 받고 싶을때 @ResponseBody를 적어줘야함
	*/
	/*
	//濡쒓퉭�쓣 �쐞�븳 蹂��닔
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	*/
	
	@Inject
	MemberService memberService;
	
/*	@ResponseBody
	@RequestMapping("hiandroid")
	public ModelAndView hiand() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.allinfo();
		mav.setViewName("member/member_list");
		mav.addObject("list", list);
		return mav;
	}
*/	
	/*@ResponseBody
	@RequestMapping("hiandroid")
	public Map hiand() {
		List<MemberDTO> list = memberService.allinfo();
		Map result = new HashMap();
		result.put("result",Boolean.TRUE);
		result.put("data", list);
		
		return result;
	}*/
	
	@ResponseBody
	@RequestMapping(value="allmember", method=RequestMethod.GET)
	public Map byeandroid() {
		 List<MemberDTO> list = memberService.allinfo();
	      Map result = new HashMap();
	      result.put("result",Boolean.TRUE);
	      result.put("data", list);
	      System.out.println("ddddddddddddd");
	      return result;
	}
	
	@RequestMapping(value="addcolum", method=RequestMethod.POST,
	produces="application/json; charset=UTF-8")
	public void testPost(HttpServletRequest request){
		MemberDTO dto = new MemberDTO();
		try {
			System.out.println("정상적으로 서버에서 값을 받음");
			String id = request.getParameter("mysqlId");
			String pw = request.getParameter("mysqlPw");
			String email = request.getParameter("mysqlEmail");
			String name = request.getParameter("mysqlName");
			String introduce = request.getParameter("mysqlIntroduce");
			System.out.println(id+pw+email+name+introduce);
			dto.setId(id);
			dto.setPw(pw);
			dto.setEmail(email);
			dto.setName(name);
			dto.setIntroduce(introduce);
			memberService.testInsert(dto);
			//return null;
		}catch(Exception e) {
			System.out.println("서버 값 못 받음");
			e.printStackTrace();
			//return dto;
		}
	}
	
	@ResponseBody
	@RequestMapping("hiandroid")
	public MemberDTO hiand() {
		MemberDTO member = new MemberDTO("hi", "1111" , "a@b.c", "�넗鍮�", "釉붾（踰좊━");
		return member;
	}
	@RequestMapping("/")
	public String first() {
		return "home";
	}
	
	//濡쒓렇�씤 �럹�씠吏�
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	//濡쒓렇�븘�썐
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/login";
	}

	//�쉶�썝媛��엯 �럹�씠吏�
	@RequestMapping("join.do")
	public String join() {
		return "member/join";
	}
	//�쉶�썝媛��엯(�젙蹂댁엯�젰)
	@RequestMapping("sign_up.do")
	public String sign_up(@ModelAttribute MemberDTO dto) {
		memberService.insert(dto);
		return "redirect:/member/login.do";	//�솢 redirect:/member/login �씠��濡쒗븯硫� �꽣吏�二� 
	}
	
	//濡쒓렇�씤泥댄겕
	@RequestMapping("login_check.do")
	public ModelAndView login_check(@ModelAttribute MemberDTO dto, HttpSession session) {
		//logger.debug("ddd");
		System.out.println("�뱾�뼱��");
		String name = memberService.loginCheck(dto,session);
		ModelAndView mav = new ModelAndView();
		if(name!=null) {
			mav.setViewName("home");
		}
		return mav;
	}
	
	//�궡 �젙蹂대낫湲�
	@RequestMapping("myinfo/{name}")
	public ModelAndView myinfo(@PathVariable String name) {
		MemberDTO dto = new MemberDTO();
		ModelAndView mav = new ModelAndView();
		dto = memberService.myinfo(name);
		if(dto==null) {
			System.out.println("�젙蹂대낫湲곗삤瑜� (controller)");
			return null;
		}
		mav.setViewName("member/view");
		mav.addObject("dto",dto);
		return mav;
	}
	
	//�젙蹂� �닔�젙 �럹�씠吏�
	@RequestMapping("update/{name}")
	//@PathVariable String name, �븞�꽔�뼱�룄 �맂�떎. �꽔�쑝硫� /湲�踰덊샇
	//�씠由꾩쓣 �꽆寃⑥＜�뒗�뜲 �씠由꾩쓣 諛붽씀硫� �븞�릺吏�!
	public String update(@ModelAttribute MemberDTO dto) throws IOException {
		memberService.update(dto);
		return "redirect:../myinfo/{name}";
		/*return "redirect:../afterUpdate.do";*/
	}
	
	//////////////////////ADMIN//////////////////////
	//紐⑤뱺 �쉶�썝�젙蹂� 蹂닿린
	@RequestMapping("member_list.do")
	public ModelAndView allinfo() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.allinfo();
		mav.setViewName("member/member_list");
		mav.addObject("list", list);
		return mav;
	}
	
	//�쉶�썝 �븳紐� �궘�젣
	@RequestMapping("delete/{id}")
	public String delete(@PathVariable String id) {
		System.out.println(id);
		memberService.delete(id);
		return "redirect:../afterDelete.do";
	}
	
	// �쉶�썝�궘�젣 �썑
	@RequestMapping("afterDelete.do")
	public String afterUpdate() {
		return "home";
	}
	
}
