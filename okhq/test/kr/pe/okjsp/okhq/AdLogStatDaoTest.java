package kr.pe.okjsp.okhq;

import java.util.List;

import junit.framework.TestCase;
import kr.pe.okjsp.ad.AdLog;

public class AdLogStatDaoTest extends TestCase {
	public void testGetList() {
		AdLogStatDao dao = new AdLogStatDao();
		int result = dao.getList().size();
		assertTrue(0 < result);
	}
	
	public void testGetHistoryDate() {
		AdLogStatDao dao = new AdLogStatDao();
		List<AdLog> list = dao.getHistory("2012-05-01");
		assertTrue(list.size()>0);
	}
}
