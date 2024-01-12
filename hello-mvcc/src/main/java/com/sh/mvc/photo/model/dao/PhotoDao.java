package com.sh.mvc.photo.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sh.mvc.photo.model.exception.PhotoException;
import com.sh.mvc.photo.model.vo.Photo;

public class PhotoDao {
	private Properties prop = new Properties();
	
	public PhotoDao() {
		String filename = PhotoDao.class.getResource("/sql/photo/photo-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getTotalContent(Connection conn) {
		int totalContent = 0;
		String sql = prop.getProperty("getTotalContent");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery();
		) {
			while(rset.next())
				totalContent = rset.getInt(1);
		} catch (SQLException e) {
			throw new PhotoException(e);
		}
		return totalContent;
	}

	public List<Photo> findPhoto(Connection conn, int start, int end) {
		List<Photo> photos = new ArrayList<>();
		String sql = prop.getProperty("findPhoto");
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			try (ResultSet rset = pstmt.executeQuery()) {
				while(rset.next())
					photos.add(handlePhotoResultSet(rset));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return photos;
	}

	private Photo handlePhotoResultSet(ResultSet rset) throws SQLException {
		int no = rset.getInt("no");
		String writer = rset.getString("writer");
		String content = rset.getString("content");
		String originalFilename = rset.getString("original_filename");
		String renamedFilename = rset.getString("renamed_filename");
		int readCount = rset.getInt("read_count");
		Date regDate = rset.getDate("reg_date");
		
		return new Photo(no, writer, content, originalFilename, renamedFilename, renamedFilename, regDate);
	}
}
