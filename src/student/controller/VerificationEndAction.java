package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class VerificationEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("verificaionEndAction의 execute()...");
		String pwd = req.getParameter("Whatpwd");
		req.setAttribute("checkPwd", pwd);
		this.setViewPage("student/verificationResult.jsp");
		this.setRedirect(false);
	}

}
