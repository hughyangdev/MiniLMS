package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import student.persistence.StudentDAOMyBatis;

public class RegisterClassEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("RegisterClassEndAction의 execute()...");

		StudentDAOMyBatis dao = new StudentDAOMyBatis();
		req.setCharacterEncoding("UTF-8");

		String registerSub = req.getParameter("RegisterSubName");
		String registerSnum = req.getParameter("RegisterStudentNum");
		//System.out.println(registerSub + "/" + registerSnum);
		
		int n = dao.registerClass(registerSub, registerSnum);

		String msg = (n > 0) ? "신청 성공" : "신청 실패";
		String loc = (n > 0) ? "checkregisterClass.do" : "javascript:history.back()";
		
		this.setViewPage(CommonUtil.addMsgLoc(req, msg, loc));
		this.setRedirect(false);
	}

}
