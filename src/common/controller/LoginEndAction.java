package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.exception.NotUserException;
import common.base.CommonUtil;
import manager.domain.ManagerVO;
import prof.domain.ProfessorVO;
import student.domain.StudentVO;
import manager.persistence.ManagerDAOMyBatis;
import prof.persistence.ProfessorDAOMyBatis;
import student.persistence.StudentDAOMyBatis;

public class LoginEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String myctx = req.getContextPath();

		System.out.println("LoginEndAction의 execute()...");
		String userid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		String checkIdentify = req.getParameter("checkIdentify");
		// System.out.println(userid + pwd + checkIdentify);
		if (userid == null || pwd == null || checkIdentify == null || userid.trim().isEmpty() || pwd.trim().isEmpty()
				|| checkIdentify.trim().isEmpty()) {
			this.setViewPage("login.do");
			this.setRedirect(true);
			return;
		}

		HttpSession session = req.getSession();
		switch (checkIdentify) {
		case "student":
			try {
				StudentDAOMyBatis studentDao = new StudentDAOMyBatis();
				StudentVO svo = studentDao.loginCheck(userid, pwd);
				if (svo != null) {
					session.setAttribute("loginUser", svo);
				}
				this.setRedirect(true);
				this.setViewPage(myctx + "/student/index.do");
			} catch (NotUserException e) {
				// TODO: handle exception
				String msg = e.getMessage();
				this.setRedirect(false);
				this.setViewPage(CommonUtil.addMsgBack(req, msg));
				return;
			}
			break;
		case "professor":
			try {
				ProfessorDAOMyBatis professorDao = new ProfessorDAOMyBatis();
				ProfessorVO pvo = professorDao.loginCheck(userid, pwd);
				if (pvo != null) {
					session.setAttribute("ploginUser", pvo);
				}
				this.setRedirect(true);
				this.setViewPage(myctx + "/prof/index.do");
			} catch (NotUserException e) {
				// TODO: handle exception
				String msg = e.getMessage();
				this.setRedirect(false);
				this.setViewPage(CommonUtil.addMsgBack(req, msg));
				return;
			}
			break;
		case "manager":
			try {
				ManagerDAOMyBatis managerDao = new ManagerDAOMyBatis();
				ManagerVO mvo = managerDao.loginCheck(userid, pwd);
				if (mvo != null) {
					session.setAttribute("mloginUser", mvo);
				}
				this.setRedirect(true);
				this.setViewPage(myctx + "/admin/index.do");
			} catch (NotUserException e) {
				// TODO: handle exception
				String msg = e.getMessage();
				this.setRedirect(false);
				this.setViewPage(CommonUtil.addMsgBack(req, msg));
				return;
			}
			break;
		}

	}
}
