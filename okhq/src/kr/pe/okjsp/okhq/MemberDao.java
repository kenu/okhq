package kr.pe.okjsp.okhq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.pe.okjsp.member.Member;
import kr.pe.okjsp.member.MemberHandler;
import kr.pe.okjsp.util.DbCon;

public class MemberDao extends MemberHandler {
	private String AD_LOG_STAT = "select * from okmember order by sid desc";
	DbCon dbCon = new DbCon();

	private Member getMember(ResultSet rs) throws SQLException {
		Member row = new Member();
		row.setName(rs.getString("name"));
		row.setEmail(rs.getString("email"));
		row.setMailing(rs.getString("mailing"));
		row.setJoindate(rs.getTimestamp("joindate"));
		row.setSid(rs.getLong("sid"));
		row.setId(rs.getString("id"));
		row.setPoint(rs.getLong("point"));
		return row;
	}
	
	public List<Member> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Member> list = new ArrayList<Member>();
		
		try {
			conn = dbCon.getConnection();
			pstmt = conn.prepareStatement(AD_LOG_STAT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(getMember(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbCon.close(conn, pstmt, rs);
		}
		return list;
	}

	public List<Member> getList(int limit) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Member> list = new ArrayList<Member>();
		
		try {
			conn = dbCon.getConnection();
			pstmt = conn.prepareStatement(AD_LOG_STAT + " limit "+ limit);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(getMember(rs));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbCon.close(conn, pstmt, rs);
		}
		return list;
	}

}