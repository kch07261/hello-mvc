package com.sh.mvc.photo.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import static com.sh.mvc.common.JdbcTemplate.*;
import com.sh.mvc.photo.model.dao.PhotoDao;
import com.sh.mvc.photo.model.vo.Photo;

public class PhotoService {
	private final PhotoDao photoDao = new PhotoDao();

	public int getTotalContent() {
		Connection conn = getConnection();
		int totalContent = photoDao.getTotalContent(conn);
		close(conn);
		return totalContent;
	}

	public List<Photo> findPhoto(int start, int end) {
		Connection conn = getConnection();
		List<Photo> photos = photoDao.findPhoto(conn, start, end);
		close(conn);
		return photos;
	}
	
}
