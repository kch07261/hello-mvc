package com.sh.mvc.member.model.service;

import static com.sh.mvc.common.JdbcTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.sh.mvc.member.model.dao.MemberDao;
import com.sh.mvc.member.model.vo.Member;
import com.sh.mvc.member.model.vo.MemberRole;

public class MemberService {
	public final MemberDao memberDao = new MemberDao();

	
	/**
	 * DQL	(select..)
	 * 1. Connection 생성					- service
	 * 2. PreparedStatement 생성 및 ?값 대입	- dao
	 * 3. 실행 및 ResultSet처리				- dao
	 * 4. 자원반납							- service
	 * 
	 * DML	(insert, update, delete)
	 * 1. Connection 생성 (setAutoCommit : false)
	 * 2. PreparedStatement 생성 및 ?값 대입
	 * 3. 실행 및 int반환
	 * 4. 트랜잭션 (commit/rollback)
	 * 5. 자원반납
	 * 
	 * @param memberId
	 * @return
	 */
	public Member findById(String memberId) {
		Connection conn = getConnection();
		Member member = memberDao.findById(conn, memberId);
		close(conn);
		return member;
	}


	public int insertMember(Member newMember) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.insertMember(conn, newMember);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}


	public int updateMember(Member member) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.updateMember(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteMember(String memberId) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.deleteMember(conn, memberId);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


	public List<Member> findAll() {
		Connection conn = getConnection();
		List<Member> members = memberDao.findAll(conn);
		close(conn);
		return members;
	}


	public int updateMemberRole(String memberId, MemberRole memberRole) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.updateMemberRole(conn, memberId, memberRole);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}


	public List<Member> searchMember(String searchType, String searchKeyword) {
		Connection conn = getConnection();
		List<Member> members = memberDao.searchMember(conn, searchType, searchKeyword);
		close(conn);
		
		return members;
	}
}
