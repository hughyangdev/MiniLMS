package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MsgAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MsgAction의 execute()...");

		String message = req.getParameter("message");
		String loc = req.getParameter("loc");

		req.setAttribute("message", message);
		req.setAttribute("loc", loc);
		this.setViewPage("msg.jsp");
		this.setRedirect(false);

	}

}
