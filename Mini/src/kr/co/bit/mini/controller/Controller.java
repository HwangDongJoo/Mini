package kr.co.bit.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
