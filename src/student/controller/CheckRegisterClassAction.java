package student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import student.domain.RegistClassVO;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class CheckRegisterClassAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("CheckRegisterClassAction의 execute()...");

		StudentDAOMyBatis dao = new StudentDAOMyBatis();

		HttpSession session = req.getSession();
		StudentVO loginUser = (StudentVO) session.getAttribute("loginUser");
		int snum = loginUser.getSnum();

		List<RegistClassVO> rList = dao.getAllMyClass(snum);
		int sumCredit = 0;
		for (RegistClassVO rvo : rList) {
			sumCredit += rvo.getCredit();
		}
		
		int count = dao.getAllClassCount(snum);
		//System.out.println("count" + count);
		//System.out.println("credit" + sumCredit);
		
		req.setAttribute("totalCredit", sumCredit);
		req.setAttribute("rList", rList);
		req.setAttribute("countAll", count);
		
		this.setViewPage("student/CheckRegisterClass.jsp");
		this.setRedirect(false);
	}

}
