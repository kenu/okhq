package kr.pe.okjsp.okhq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import kr.pe.okjsp.ad.AdLog;
import kr.pe.okjsp.util.DateUtil;
import kr.pe.okjsp.util.DbCon;

public class AdLogStatDao {
	private static Logger logger = Logger.getLogger("OKHQ-LOG");

	private String AD_LOG_STAT = "select date_format(credate, '%Y-%m-%d') as ldate, "
			+ "count(date_format(credate, '%Y-%m-%d')) as lcount "
			+ "from okad_log group by date_format(credate, '%Y-%m-%d') order by 1 desc";
	private String AD_LOG_STAT_BY_MONTH = "select date_format(credate, '%Y-%m-%d') as ldate, "
			+ "count(date_format(credate, '%Y-%m-%d')) as lcount "
			+ "from okad_log where credate between CAST(TO_DATE(?,'YYYYMM') AS TIMESTAMP) "
			+ "and CAST(TO_DATE(?,'YYYYMM') AS TIMESTAMP) "
			+ "group by date_format(credate, '%Y-%m-%d') order by 1 desc";
	private String AD_LOG_HISTORY = "select * from okad_log where url like 'app%' order by 1 desc limit 500";
	private String AD_LOG_HISTORY_OF_DATE = "select * from okad_log where credate between ? and ? order by url desc";
	private String AD_LOG_SUMMARY_OF_DATE = "select url, count(*) `count` from okad_log where credate between ? and ? group by url";
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
			logger.info(e.toString());
		} finally {
			dbCon.close(conn, pstmt, rs);
		}
		return list;

	}

	public List<AdLogStatDto> getListByMonth(String yyyyMM) {
		if (yyyyMM == null) {
			yyyyMM = getCurrentMonth();
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<AdLogStatDto> list = new ArrayList<AdLogStatDto>();

		try {
			conn = dbCon.getConnection();
			pstmt = conn.prepareStatement(AD_LOG_STAT_BY_MONTH);
			pstmt.setString(1, yyyyMM);
			pstmt.setString(2, getNextMonth(yyyyMM));

			rs = pstmt.executeQuery();
			while (rs.next()) {
				AdLogStatDto row = new AdLogStatDto();
				row.setLdate(rs.getString("ldate"));
				row.setLcount(rs.getInt("lcount"));
				list.add(row);
			}

		} catch (Exception e) {
			logger.info(e.toString());
		} finally {
			dbCon.close(conn, pstmt, rs);
		}
		return list;

	}

	public String getCurrentMonth() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		return sdf.format(new Date());
	}

	public String getNextMonth(String yyyyMM) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String nextMonth = null;
		try {
			Date date = sdf.parse(yyyyMM);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.MONTH, 1);
			nextMonth = sdf.format(cal.getTime());
		} catch (ParseException e) {
			logger.info(e.toString());
		}
		return nextMonth;
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
			logger.info(e.toString());
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
			pstmt.setTimestamp(2,
					new Timestamp(DateUtil.parse(DateUtil.addDate(date, 1))
							.getTime()));
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
			logger.info(e.toString());
		} finally {
			dbCon.close(conn, pstmt, rs);
		}
		return list;

	}

	public List<AdLogSummary> getSummary(String date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<AdLogSummary> list = new ArrayList<AdLogSummary>();
		if (date == null) {
			return list;
		}
		try {
			conn = dbCon.getConnection();
			pstmt = conn.prepareStatement(AD_LOG_SUMMARY_OF_DATE);
			pstmt.setTimestamp(1, new Timestamp(DateUtil.parse(date).getTime()));
			pstmt.setTimestamp(2,
					new Timestamp(DateUtil.parse(DateUtil.addDate(date, 1))
							.getTime()));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AdLogSummary row = new AdLogSummary();
				row.setUrl(rs.getString("url"));
				row.setCount(rs.getInt("count"));
				list.add(row);
			}

		} catch (Exception e) {
			logger.info(e.toString());
		} finally {
			dbCon.close(conn, pstmt, rs);
		}
		return list;

	}

}
