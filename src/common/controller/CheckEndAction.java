package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String boardPwd = req.getParameter("boardPwd");
		// 입력값
		HttpSession session = req.getSession();
		String pwd = (String) session.getAttribute("pwd");
		// 비밀번호
		// System.out.println("checkEndAction pwd" + pwd);

		req.setAttribute("boardPwd", boardPwd);
		this.setViewPage("member/CheckResult.jsp");
		this.setRedirect(false);
	}

}
