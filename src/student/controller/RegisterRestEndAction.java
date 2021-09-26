package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import student.domain.StopSemesterVO;
import student.persistence.StudentDAOMyBatis;

public class RegisterRestEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("RegisterRestEndAction의 execute()...");
		String snum = req.getParameter("num");
		String grade = req.getParameter("grade");
		String semester = req.getParameter("semester");
		String reason = req.getParameter("restReason");
		System.out.println(snum + "/" + grade + "/" + semester + "/" + reason);

		StudentDAOMyBatis dao = new StudentDAOMyBatis();
		StopSemesterVO ssvo = new StopSemesterVO(Integer.parseInt(snum), reason, Integer.parseInt(grade),
				Integer.parseInt(semester), 0, null);
		int n = dao.registerRest(ssvo);

		String msg = (n > 0) ? "신청 성공" : "신청 실패";
		String loc = (n > 0) ? "checkregisterRest.do" : "javascript:history.back()";
		String viewpage = CommonUtil.addMsgLoc(req, msg, loc);
		
		HttpSession session=req.getSession();
		session.setAttribute("snum", snum);
		
		this.setViewPage(viewpage);
		this.setRedirect(false);

	}

}
