package com.movie.ace.member;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegisterRequestValidator implements Validator{
	//이메일 정규표현
		private static final String emailRegExp =
				"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
			    "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		 
		//아이디 정규표현
		private static final String idRegExp =
				"^[a-zA-Z0-9]{4,12}$";
		
		//비밀번호 정규표현
		private static final String pwRegExp =
				//영문자,숫자,특수문자를 하나이상 포함하여 8~16자
				"^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$";
		
		//Postcode 정규표현
		private static final String postcodeReg =
				"^[0-9]{1,6}$";
		
		//Address 정규표현
//		private static final String addressReg =
//				//한글,영문대소문자,공백,숫자 허용
//				"^[가-힣a-zA-Z_-\\s\\d]$";
		
		//비교할 패턴 생성
		private Pattern emailPattern;
		private Pattern idPattern;
		private Pattern pwPattern;
		private Pattern postcodePattern;
//		private Pattern addressPattern;
		
		public RegisterRequestValidator() {
			emailPattern = Pattern.compile(emailRegExp);
			idPattern = Pattern.compile(idRegExp);
			pwPattern = Pattern.compile(pwRegExp);
			postcodePattern = Pattern.compile(postcodeReg);
//			addressPattern = Pattern.compile(addressReg);
		}

		@Override
		public boolean supports(Class<?> clazz) {
			return RegisterRequest.class.isAssignableFrom(clazz);
		}

		@Override
		public void validate(Object target, Errors errors) {
			RegisterRequest regReq = (RegisterRequest) target;
			
			//Email 정규식 체크
			if(regReq.getEmail() == null || regReq.getEmail().trim().isEmpty()) {
				errors.rejectValue("email", "required", "필수 정보 입니다.");
			}else {
				Matcher emailMatcher = emailPattern.matcher(regReq.getEmail());
				if(!emailMatcher.matches()) {
					errors.rejectValue("email", "bad", "올바르지 않는 형식입니다.");
				}
			}
			
			// 비밀번호 정규식 체크
			if(regReq.getPw().isEmpty()) {
				errors.rejectValue("pw", "required", "필수 정보 입니다.");
			}else {
				Matcher pwMatcher = pwPattern.matcher(regReq.getPw());
				if(!pwMatcher.matches()) {
					errors.rejectValue("pw", "bad", "영문자,숫자,특수문자를 하나이상 포함하여 8~16자로 입력해주세요");
				}
				if(!regReq.isPwEqualToCheckPw()) {
	                errors.rejectValue("checkPw", "nomatch", "비밀번호가 일치하지 않습니다.");
				}
			}
			
			// 아이디 정규식 체크
			if(regReq.getId() == null || regReq.getId().trim().isEmpty()) {
				errors.rejectValue("id", "required", "필수 정보 입니다.");
			}else {
				Matcher idMatcher = idPattern.matcher(regReq.getId());
				if(!idMatcher.matches()) {
					errors.rejectValue("id", "bad", "아이디는 4~12자의 영문 대소문자와 숫자로만 입력");
				}
			}
			
			//Postcode 정규식 체크
			if(regReq.getPostcode() == null || regReq.getPostcode().trim().isEmpty()) {
				errors.rejectValue("postcode", "required", "필수 정보 입니다.");
			}else {
				Matcher postcodeMatcher = postcodePattern.matcher(regReq.getPostcode());
				if(!postcodeMatcher.matches()) {
					errors.rejectValue("postcode", "bad", "우편번호 찾기 기능을 이용하세요");
				}
			}
			
			//Address 정규식 체크
//			if(regReq.getAddress() == null || regReq.getAddress().trim().isEmpty()) {
//				errors.rejectValue("address", "required", "필수 정보 입니다.");
//			}else {
//				Matcher addressMatcher = addressPattern.matcher(regReq.getAddress());
//				if(!addressMatcher.matches()) {
//					errors.rejectValue("address", "bad", "우편번호 찾기 기능을 이용하세요");
//				}
//			}
			
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birth", "required", "필수 정보 입니다.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required", "필수 정보 입니다.");
	        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "checkPw", "required", "필수 정보 입니다.");
	        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "required", "필수 정보 입니다.");
	        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "detailAddress", "required", "필수 정보 입니다.");
	        
		}
		public String idcheck(Object target, Errors errors) {
			RegisterRequest regReq = (RegisterRequest) target;
			if(regReq.getId() == null || regReq.getId().trim().isEmpty()) {
				errors.rejectValue("id", "required", "필수 정보 입니다.");
			}else {
				Matcher idMatcher = idPattern.matcher(regReq.getId());
				if(!idMatcher.matches()) {
					errors.rejectValue("id", "bad", "아이디는 4~12자의 영문 대소문자와 숫자로만 입력 가능합니다.");
				}
			}
			return regReq.getId();
		}
}
