package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import student.persistence.StudentDAOMyBatis;

public class DeleteRegisterAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DeleteRegisterAction의 execute()...");
		String snum = req.getParameter("snum");
		if (snum == null || snum.trim().isEmpty()) {
			this.setViewPage(CommonUtil.addMsgBack(req, "잘못된 경로입니다."));
			this.setRedirect(false);
		}

		StudentDAOMyBatis dao = new StudentDAOMyBatis();

		int n = dao.deleteRest(snum);
		this.setViewPage("checkregisterRest.do");
		this.setRedirect(true);
	}
}
