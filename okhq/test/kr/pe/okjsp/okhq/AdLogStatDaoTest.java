package kr.pe.okjsp.okhq;

import junit.framework.TestCase;

public class AdLogStatDaoTest extends TestCase {
	public void testGetList() {
		AdLogStatDao dao = new AdLogStatDao();
		int result = dao.getList().size();
		assertTrue(0 < result);
	}
}
