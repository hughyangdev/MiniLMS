package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String pwd = req.getParameter("pwd");
		// System.out.println("checkAction pwd" + pwd); [0]
		String bnum = req.getParameter("bnum");
		HttpSession session = req.getSession();

		session.setAttribute("pwd", pwd);
		session.setAttribute("bnum", bnum);
		this.setRedirect(false);
		this.setViewPage("member/check.jsp");

	}
}
