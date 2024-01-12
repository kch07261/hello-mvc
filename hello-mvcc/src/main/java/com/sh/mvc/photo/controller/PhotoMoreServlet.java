package com.sh.mvc.photo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sh.mvc.photo.model.service.PhotoService;
import com.sh.mvc.photo.model.vo.Photo;

/**
 * Servlet implementation class PhotoMoreServlet
 */
@WebServlet("/photo/photoMore")
public class PhotoMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final PhotoService photoService = new PhotoService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 처리
		int limit = 5;
		int cpage = 1;
		try {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		} catch (NumberFormatException e) {
		}
		
		int start = (cpage - 1) * limit + 1;
		int end = cpage * limit;
		
		// 2. 업무로직
		List<Photo> photos = photoService.findPhoto(start, end);
		System.out.println("photos = " + photos);
		
		// 3. 응답처리 (json)
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(photos, response.getWriter());
	}


}
