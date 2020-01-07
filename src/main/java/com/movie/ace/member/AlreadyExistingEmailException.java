package com.movie.ace.member;

public class AlreadyExistingEmailException extends RuntimeException{
	public AlreadyExistingEmailException(String message) {
		super(message);
	}
}
