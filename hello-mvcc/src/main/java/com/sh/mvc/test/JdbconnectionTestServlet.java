package com.sh.mvc.test;

import static com.sh.mvc.common.JdbcTemplate.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JdbconnectionTestServlet
 */
@WebServlet("/test/jdbc")
public class JdbconnectionTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// db 접속테스트
		
		// DQL버젼
		// 1. 드라이버클래스 등록(JdbcTemplate)
		// 2. Connection객체 생성
		Connection conn = getConnection();
		// 3. PreparedStatement객체 생성 (query) 및 미완성쿼리 값대입
		String sql = "select * from member";
		try (
				PreparedStatement pstmt = conn.prepareStatement(sql);
				// 4. 실행 및 ResultSet처리
				ResultSet rset = pstmt.executeQuery();
		) {
			while(rset.next()) {
				String memberId = rset.getString("member_id");
				String name = rset.getString("name");
				int point = rset.getInt("point");
				Date enrollDate = rset.getDate("enroll_date");
				System.out.printf("%s, %s, %d, %s\n", memberId, name, point, enrollDate);
			}
			// 5. 자원반납
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
