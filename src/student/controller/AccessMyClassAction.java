package student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import student.domain.RegistClassVO;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class AccessMyClassAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("AccessMyClassAction의 execute()...");
		StudentDAOMyBatis dao = new StudentDAOMyBatis();

		HttpSession session = req.getSession();
		StudentVO loginUser = (StudentVO) session.getAttribute("loginUser");
		int snum = loginUser.getSnum();

		List<RegistClassVO> aList = dao.getAllMyClass(snum);

		req.setAttribute("aList", aList);
		this.setViewPage("student/accessMyClass.jsp");
		this.setRedirect(false);
	}
}
