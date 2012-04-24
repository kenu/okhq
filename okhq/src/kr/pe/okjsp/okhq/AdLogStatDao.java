package kr.pe.okjsp.okhq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.pe.okjsp.util.DbCon;

public class AdLogStatDao {

	private String AD_LOG_STAT = "select date_format(credate, '%Y-%m-%d') as ldate, " +
			"count(date_format(credate, '%Y-%m-%d')) as lcount " +
			"from okad_log group by date_format(credate, '%Y-%m-%d') order by 1 desc";
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

}
