package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.controller.AbstractAction;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class SearchNumResultAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("SearchNumResultAction의 execute()...");
		String studentNum = req.getParameter("studentNum");
		StudentDAOMyBatis dao = new StudentDAOMyBatis();
		StudentVO slist = dao.selectStudentBySNum(studentNum);
		System.out.println(slist);
		req.setAttribute("studentNum", studentNum);
		req.setAttribute("slist", slist);
		this.setViewPage("student/studentPrivateInfo.jsp");
		this.setRedirect(false);

	}

}
