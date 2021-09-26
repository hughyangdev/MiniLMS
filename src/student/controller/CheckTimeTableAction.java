package student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import student.domain.RegistClassVO;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class CheckTimeTableAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("CheckTimeTableAction의 execute()....");

		StudentDAOMyBatis dao = new StudentDAOMyBatis();
		HttpSession session = req.getSession();
		StudentVO svo = (StudentVO) session.getAttribute("loginUser");
		int snum = svo.getSnum();

		List<RegistClassVO> timetable = dao.selectCompleteClassForTable(snum);
		/*
		 * for (RegistClassVO rvo : timetable) { System.out.println(rvo.getCtime()); }
		 */
		
		req.setAttribute("timetable", timetable);

		this.setViewPage("student/CheckTimeTable.jsp");
		this.setRedirect(false);
	}

}
