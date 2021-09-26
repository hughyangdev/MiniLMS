package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import student.domain.StopSemesterVO;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class CheckRegisterRestAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("CheckRegisterRestAction의 execute()...");
		HttpSession session = req.getSession();
		StudentVO svo = (StudentVO) session.getAttribute("loginUser");
		// System.out.println(snum);
		int snum = svo.getSnum();
		StudentDAOMyBatis dao = new StudentDAOMyBatis();
		StopSemesterVO ssvo = dao.selectRestBySnum(snum);
		req.setAttribute("rvo", ssvo);
		this.setViewPage("student/checkRegisterRest.jsp");
		this.setRedirect(false);
	}

}
