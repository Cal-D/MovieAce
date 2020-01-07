package com.movie.ace.member;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ModifyRequestValidator implements Validator{
		
		//비밀번호 정규표현
		private static final String pwRegExp =
				//영문자,숫자,특수문자를 하나이상 포함하여 8~16자
				"^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$";
		
		//Postcode 정규표현
		private static final String postcodeReg =
				"^[0-9]{1,6}$";
		
		//비교할 패턴 생성
		private Pattern pwPattern;
		private Pattern postcodePattern;
		
		public ModifyRequestValidator() {
			pwPattern = Pattern.compile(pwRegExp);
			postcodePattern = Pattern.compile(postcodeReg);
		}

		@Override
		public boolean supports(Class<?> clazz) {
			return ModifyRequest.class.isAssignableFrom(clazz);
		}

		@Override
		public void validate(Object target, Errors errors) {
			ModifyRequest modReq = (ModifyRequest) target;
			
			// 비밀번호 정규식 체크
			if(modReq.getPw().isEmpty()) {
				errors.rejectValue("pw", "required", "필수 정보 입니다.");
			}else {
				Matcher pwMatcher = pwPattern.matcher(modReq.getPw());
				if(!pwMatcher.matches()) {
					errors.rejectValue("pw", "bad", "영문자,숫자,특수문자를 하나이상 포함하여 8~16자로 입력해주세요");
				}
				if(!modReq.isPwEqualToCheckPw()) {
	                errors.rejectValue("checkPw", "nomatch", "비밀번호가 일치하지 않습니다.");
				}
			}
			
			//Postcode 정규식 체크
			if(modReq.getPostcode() == null || modReq.getPostcode().trim().isEmpty()) {
				errors.rejectValue("postcode", "required", "필수 정보 입니다.");
			}else {
				Matcher postcodeMatcher = postcodePattern.matcher(modReq.getPostcode());
				if(!postcodeMatcher.matches()) {
					errors.rejectValue("postcode", "bad", "우편번호 찾기 기능을 이용하세요");
				}
			}
			
	        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "checkPw", "required", "필수 정보 입니다.");
	        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "required", "필수 정보 입니다.");
	        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "detailAddress", "required", "필수 정보 입니다.");
	        
		}

}
