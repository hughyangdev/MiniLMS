package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import student.domain.StudentVO;

public class ChangePwdAction1 extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		this.setRedirect(false);
		this.setViewPage("../changePwd1.jsp");
	}

}
