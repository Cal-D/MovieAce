package com.movie.ace.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {
	 
	@Resource(name="memberService")
	private MemberService memberService;
	
	//View로 넘길 장르 리스트 초기화 함수
	@ModelAttribute("genreList")
	List<String> genreList(){
		List<String> genreList = new ArrayList<String>();
		genreList.add("액션");
		genreList.add("로맨스");
		genreList.add("스릴러");
		return genreList;
	}
	
	@RequestMapping(value="/signUp", method = RequestMethod.GET)
	public ModelAndView signUpForm(@ModelAttribute("registerRequest") RegisterRequest regReq) {
		ModelAndView mv = new ModelAndView("/member/signUp");
		mv.addObject(genreList());
		return mv;
	}
	
	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	public ModelAndView register(@RequestParam(value="agree", defaultValue="false") Boolean agree,
			RegisterRequest regReq, Errors errors, SessionStatus sessionStatus) throws Exception{
		new RegisterRequestValidator().validate(regReq, errors);
		ModelAndView mv = new ModelAndView();
		System.out.println("장르선택: "+regReq.getGenres());
		
		//멤버 번호 임시 오토 인크리먼트
		MemberVO memberVO = memberService.noCheck();
		int memberNo = memberVO.getMember_no();
		System.out.println("멤버번호: "+memberNo);
		regReq.setMember_no(++memberNo);
		System.out.println("저장번호: "+regReq.getMember_no());
		/////////////////////////////////////
		
		if(!agree) {
			mv.setViewName("/member/signUp");
			errors.rejectValue("agree", "disagree", "약관 동의가 필요합니다.");
			return mv;
		}
		
		if(errors.hasErrors()) {
			mv.setViewName("/member/signUp");
			return mv;
		}
		
		try {
			memberService.register(regReq);
			sessionStatus.setComplete();//세션에 저장한 GenreList 삭제
			
		}catch(AlreadyExistingIdException e) {
			errors.rejectValue("id", "duplicate", "이미 가입된 아이디 입니다.");
			mv.setViewName("/member/signUp");
			return mv;
		}catch(AlreadyExistingEmailException e) {
			errors.rejectValue("email", "duplicate", "이미 가입된 이메일 입니다.");
			mv.setViewName("/member/signUp");
			return mv;
		}
		mv.setViewName("/member/signOk");
		return mv;
	}
	
	//id 중복 체크(ajax)
		@RequestMapping(value="/idcheck", method=RequestMethod.POST)
		@ResponseBody
		public int idcheck(RegisterRequest regReq, Errors errors)throws Exception {
			String id = new RegisterRequestValidator().idcheck(regReq, errors);
			if(errors.hasErrors()) {
				if(errors.getFieldError("id").getCode().equals("required")) {
					return 2;
				}else if(errors.getFieldError("id").getCode().equals("bad")) {
					System.out.println("bad");
					return 3;
				}
			}
			int idchecked = memberService.idCheck(id);
			System.out.println("id중복체크 결과: "+idchecked);
			return idchecked;
		}
	
}
