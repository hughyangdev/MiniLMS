package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class RegisterClassAction extends AbstractAction {

	public RegisterClassAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("RegisterClassAction의 execute()...");
		this.setViewPage("student/RegisterClass.jsp");
		this.setRedirect(false);

	}

}
