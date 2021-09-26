package student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import student.domain.RegistClassVO;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class CheckGradeAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("CheckGradeAction의 execute()...");
		HttpSession session = req.getSession();
		StudentVO svo = (StudentVO) session.getAttribute("loginUser");
		StudentDAOMyBatis dao = new StudentDAOMyBatis();
		int snum = svo.getSnum();
		// System.out.println("snum==" + snum);
		int classCount = dao.getClassCount(snum);
		System.out.println("classCount" + classCount);
		List<RegistClassVO> myList = dao.getMyClassGrade(snum);

		req.setAttribute("myList", myList);
		this.setViewPage("student/CheckGrade.jsp");
		this.setRedirect(false);
	}

}
