package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class RegisterRestSearchNumAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("RegiterRestSearchNumAction의 execute()...");
		String studentNum = req.getParameter("sNum");
		StudentDAOMyBatis dao = new StudentDAOMyBatis();
		StudentVO list = dao.selectStudentBySNum(studentNum);
		System.out.println(list);
		req.setAttribute("studentNum", studentNum);
		req.setAttribute("list", list);
		this.setViewPage("student/RestSearchNum.jsp");
		this.setRedirect(false);
	}

}
