package kr.pe.okjsp.okhq;

import junit.framework.TestCase;

public class MemberDaoTest extends TestCase {
	public void testGetList() {
		MemberDao dao = new MemberDao();
		int result = dao.getList().size();
		assertTrue(0 < result);
	}
}
