package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import student.persistence.StudentDAOMyBatis;

public class DeleteClassAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DeleteClassAction의 execute()...");

		StudentDAOMyBatis dao = new StudentDAOMyBatis();

		String snum = req.getParameter("deleteClassSnum");
		String lname = req.getParameter("deleteClassSubName");

		int n = dao.deleteClass(snum, lname);

		// String msg = (n > 0) ? "취소 성공" : "취소 실패";
		// String loc = (n > 0) ? "checkregisterClass.do" : "javascript:history.back()";

		this.setViewPage("checkregisterClass.do");
		this.setRedirect(true);
	}

}
