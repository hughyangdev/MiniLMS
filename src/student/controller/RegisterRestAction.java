package student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class RegisterRestAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("RegisterRestAction의 execute()...");
		this.setViewPage("student/RegisterRest.jsp");
		this.setRedirect(false);

	}

}
