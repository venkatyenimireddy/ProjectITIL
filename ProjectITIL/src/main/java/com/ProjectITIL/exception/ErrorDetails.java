package com.ProjectITIL.exception;

import java.time.LocalDateTime;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ErrorDetails {

	private LocalDateTime timestamp;
	String message;
	String url;

	public ErrorDetails(LocalDateTime timestamp, String message, String url) {
		super();
		this.timestamp = timestamp;
		this.message = message;
		this.url = url;
	}


	public LocalDateTime getTimestamp() { return timestamp; }

	public String getMessage() { return message; }

	public String getUrl() { return url; }

}
