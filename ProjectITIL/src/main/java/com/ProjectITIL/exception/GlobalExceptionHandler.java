package com.ProjectITIL.exception;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;



@ControllerAdvice
public class GlobalExceptionHandler  {

	private static final Logger LOGGER = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	@ExceptionHandler(SQLException.class)
	public String handleSQLException(HttpServletRequest request, Exception ex){
		LOGGER.info("SQLException Occured:: URL="+request.getRequestURL());
		return "database_error";
	}

	@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="IOException occured")
	@ExceptionHandler(IOException.class)
	public void handleIOException(){
		LOGGER.error("IOException handler executed");
		//returning 404 error code
	}

	@ExceptionHandler(Exception.class)
	public String handleGenericException(HttpServletRequest request, Exception ex){
		LOGGER.info("GenericException Occured:: URL="+request.getRequestURL());
		return "generic_error";
	}


}

