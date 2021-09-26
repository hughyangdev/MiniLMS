package student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import student.domain.AccessmentVO;
import student.persistence.AccessDAOMyBatis;

public class AccessClassAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("AccessClassAction의 execute()...");
		String subject = req.getParameter("accessSubject");
		String prof = req.getParameter("accessProf");
		AccessDAOMyBatis dao = new AccessDAOMyBatis();
		List<AccessmentVO> aList = dao.getAllQuestions();

		req.setAttribute("subject", subject);
		req.setAttribute("prof", prof);
		req.setAttribute("aList", aList);
		req.setAttribute("aListSize", aList.size());
		this.setViewPage("student/AccessClass.jsp");
		this.setRedirect(false);
	}

}
