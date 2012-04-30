package kr.pe.okjsp.okhq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import kr.pe.okjsp.ad.AdLog;
import kr.pe.okjsp.util.DateUtil;
import kr.pe.okjsp.util.DbCon;

public class AdLogStatDao {

	private String AD_LOG_STAT = "select date_format(credate, '%Y-%m-%d') as ldate, " +
			"count(date_format(credate, '%Y-%m-%d')) as lcount " +
			"from okad_log group by date_format(credate, '%Y-%m-%d') order by 1 desc";
	private String AD_LOG_HISTORY = "select * from okad_log where url like 'app%' order by 1 desc limit 500";
	private String AD_LOG_HISTORY_OF_DATE = "select * from okad_log where credate between ? and ? order by url desc";
	DbCon dbCon = new DbCon();

	public List<AdLogStatDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<AdLogStatDto> list = new ArrayList<AdLogStatDto>();
		
		try {
			conn = dbCon.getConnection();
			pstmt = conn.prepareStatement(AD_LOG_STAT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AdLogStatDto row = new AdLogStatDto();
				row.setLdate(rs.getString("ldate"));
				row.setLcount(rs.getInt("lcount"));
				list.add(row);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbCon.close(conn, pstmt, rs);
		}
		return list;
		
	}

	public List<AdLog> getHistory() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<AdLog> list = new ArrayList<AdLog>();
		
		try {
			conn = dbCon.getConnection();
			pstmt = conn.prepareStatement(AD_LOG_HISTORY);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AdLog row = new AdLog();
				row.setLseq(rs.getLong("lseq"));
				row.setCredate(rs.getTimestamp("credate"));
				row.setUrl(rs.getString("url"));
				row.setReferer(rs.getString("referer"));
				row.setIp(rs.getString("ip"));
				list.add(row);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbCon.close(conn, pstmt, rs);
		}
		return list;

	}
	public List<AdLog> getHistory(String date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<AdLog> list = new ArrayList<AdLog>();
		if (date == null) {
			return list;
		}
		try {
			conn = dbCon.getConnection();
			pstmt = conn.prepareStatement(AD_LOG_HISTORY_OF_DATE);
			pstmt.setTimestamp(1, new Timestamp(DateUtil.parse(date).getTime()));
			pstmt.setTimestamp(2, new Timestamp(DateUtil.parse(DateUtil.addDate(date, 1)).getTime()));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AdLog row = new AdLog();
				row.setLseq(rs.getLong("lseq"));
				row.setCredate(rs.getTimestamp("credate"));
				row.setUrl(rs.getString("url"));
				row.setIp(rs.getString("ip"));
				list.add(row);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbCon.close(conn, pstmt, rs);
		}
		return list;
		
	}

}
