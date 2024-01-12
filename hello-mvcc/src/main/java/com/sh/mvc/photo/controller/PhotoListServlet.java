package com.sh.mvc.photo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.mvc.photo.model.exception.PhotoException;
import com.sh.mvc.photo.model.service.PhotoService;

/**
 * Servlet implementation class PhotoListServlet
 */
@WebServlet("/photo/photoList")
public class PhotoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final PhotoService photoService = new PhotoService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(true)
			throw new PhotoException("내가 던진 예외");
		
		// 업무로직 - 전체게시물수 조회
		int totalContent = photoService.getTotalContent();
		System.out.println("totalContent = " + totalContent);
		int limit = 5;
		int totalPage = (int) Math.ceil((double) totalContent / limit);
		
		request.setAttribute("totalContent", totalContent);
		request.setAttribute("totalPage", totalPage);
		
		request.getRequestDispatcher("/WEB-INF/views/photo/photoList.jsp")
			.forward(request, response);
	}


}
