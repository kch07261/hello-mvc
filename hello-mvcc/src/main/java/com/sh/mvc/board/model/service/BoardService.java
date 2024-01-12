package com.sh.mvc.board.model.service;

import static com.sh.mvc.common.JdbcTemplate.close;
import static com.sh.mvc.common.JdbcTemplate.commit;
import static com.sh.mvc.common.JdbcTemplate.getConnection;
import static com.sh.mvc.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sh.mvc.board.model.dao.BoardDao;
import com.sh.mvc.board.model.vo.Attachment;
import com.sh.mvc.board.model.vo.Board;
import com.sh.mvc.board.model.vo.BoardComment;

public class BoardService {
	private final BoardDao boardDao = new BoardDao();

	public List<Board> findAll(int start, int end) {
		Connection conn = getConnection();
		List<Board> boards = boardDao.findAll(conn, start, end);
		close(conn);
		return boards;
	}

	public int getTotalContent() {
		Connection conn = getConnection();
		int totalContent = boardDao.getTotalContent(conn);
		close(conn);
		return totalContent;
	}

	public int insertBoard(Board board) {
		int result = 0;
		Connection conn= getConnection();
		try {
			
			// board 테이블 추가
			result = boardDao.insertBoard(conn, board);
			
			// 발급된 board.no를 조회	->  (attachment 테이블 추가)
			int boardNo = boardDao.getLastBoardNo(conn);
			board.setNo(boardNo); // servlet에서 redirect시 사용
			System.out.println("boardNo = " + boardNo);
			
			// attachment 테이블 추가
			List<Attachment> attachments = board.getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(Attachment attach : attachments) {
					// insert into web.attachment(seq_attachment_no.nextval, board_no, original_filename, renamed_filename)
					attach.setBoardNo(boardNo); // fk컬럼값 세팅
					result = boardDao.insertAttachment(conn, attach);
				}
			}
			
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public Board findById(int no) {
		Connection conn = getConnection();
		Board board = boardDao.findById(conn, no);
		List<Attachment> attachments = boardDao.findAttachmentByBoardNo(conn, no);
		board.setAttachments(attachments);
		close(conn);
		
		return board;
	}

	public int updateReadCount(int no) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = boardDao.updateReadCount(conn, no);
			commit(conn);
		}catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public Attachment findAttachmentById(int no) {
		Connection conn = getConnection();
		Attachment attach = boardDao.findAttachmentById(conn, no);
		close(conn);
		return attach;
	}

	public int updateBoard(Board board) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.updateBoard(conn, board);
			
			List<Attachment> attachments = board.getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(Attachment attach : attachments) {
					result = boardDao.insertAttachment(conn, attach);
				}
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	public int deleteBoard(int no) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.deleteBoard(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	public int deleteAttachment(int attachNo) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = boardDao.deleteAttachment(conn, attachNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int insertBoardComment(BoardComment boardComment) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.insertBoardComment(conn, boardComment);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	public List<BoardComment> findBoardCommentByBoardNo(int boardNo) {
		Connection conn = getConnection();
		List<BoardComment> boardComments = boardDao.findBoardCommentByBoardNo(conn, boardNo);
		close(conn);
		return boardComments;
	}

}
