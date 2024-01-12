package com.sh.mvc.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sh.mvc.member.model.exception.MemberException;
import com.sh.mvc.member.model.vo.Gender;
import com.sh.mvc.member.model.vo.Member;
import com.sh.mvc.member.model.vo.MemberRole;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		// src/main/resources/sql/member/member-query.properties 작성
		// build/classes/sql/member/member-query.properties 톰캣용 읽기파일 (이걸로 읽어와야 됨.)	/* getPath()를 작성 안할 시 : url객체를 반환 */
		String filename = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
//			System.out.println("prop@dao = " + prop);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public Member findById(Connection conn, String memberId) {
		String sql = prop.getProperty("findById"); // select * from member where member_id = ?
		Member member = null;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberId);
			try (ResultSet rset = pstmt.executeQuery()) {
				while (rset.next()) {	// 1개의 행으로
					member = handleMemberResultSet(rset);
				}
			}
			
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return member;
	}

	/**
	 * 테이블 1행 <-> vo객체 한개
	 * 
	 * @param rset
	 * @return
	 * @throws SQLException
	 */
	private Member handleMemberResultSet(ResultSet rset) throws SQLException {
		String memberId = rset.getString("member_id");
		String password = rset.getString("password");
		String name = rset.getString("name");
		MemberRole memberRole = MemberRole.valueOf(rset.getString("member_role")); // not null
		String _gender = rset.getString("gender");
		Gender gender = _gender != null ? Gender.valueOf(_gender) : null; // nullable (null이 들어올 수 있을 때)
		Date birthday = rset.getDate("birthday");
		String email = rset.getString("email");
		String phone = rset.getString("phone");
		String hobby = rset.getString("hobby");
		int point = rset.getInt("point");
		Timestamp enrollDate = rset.getTimestamp("enroll_date");
		return new Member(memberId, password, name, memberRole, gender, birthday, email, phone, hobby, point, enrollDate);
	}

	public int insertMember(Connection conn, Member newMember) {
		int result = 0;
		String sql = prop.getProperty("insertMember");
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, newMember.getMemberId());
			pstmt.setString(2, newMember.getPassword());
			pstmt.setString(3, newMember.getName());
			pstmt.setString(4, newMember.getGender() != null ? newMember.getGender().name() : null);
			pstmt.setDate(5, newMember.getBirthday());
			pstmt.setString(6, newMember.getEmail());
			pstmt.setString(7, newMember.getPhone());
			pstmt.setString(8, newMember.getHobby());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new MemberException(e);
		}
		
		return result;
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		String sql = prop.getProperty("updateMember");
		// update member set name = ?, gender = ?, birthday = ?, email = ?, phone = ?, hobby = ? where member_id = ?
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getGender() != null ? member.getGender().name() : null);
			pstmt.setDate(3, member.getBirthday());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getHobby());
			pstmt.setString(7, member.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}

	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		String sql = prop.getProperty("deleteMember");
		// delete from member where member_id = ?
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}

	public List<Member> findAll(Connection conn) {
		List<Member> members = new ArrayList<>();	// 한건 조회이면 null, 여러건일때는 new
		String sql = prop.getProperty("findAll");
		
		// ? 채워넣을것이 없으므로 그냥 2개 작성
		try (
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery();
		) {
			while(rset.next()) {
				Member member = handleMemberResultSet(rset); // 한행 한행을 member객체로 전환후
				members.add(member);	// 한행마다 members에 대입
			}
			
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		
		return members;
	}

	public int updateMemberRole(Connection conn, String memberId, MemberRole memberRole) {
		int result = 0;
		String sql = prop.getProperty("updateMemberRole");	// update member set member_role = ? where member_id = ?
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberRole.name());
			pstmt.setString(2, memberId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}

	public List<Member> searchMember(Connection conn, String searchType, String searchKeyword) {
		List<Member> members = new ArrayList<>();
		String sql = prop.getProperty("searchMember"); // select * from member where # like ?
		sql = sql.replace("#", searchType);	// # 부분을 처리해주고 PreparedStatement로 전달
		System.out.println("sql@dao = " + sql);
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, "%" + searchKeyword + "%");
			try (ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Member member = handleMemberResultSet(rset);
					members.add(member);
				}
			}
		} catch (Exception e) {
			throw new MemberException(e);
		}
		
		return members;
	}
}
