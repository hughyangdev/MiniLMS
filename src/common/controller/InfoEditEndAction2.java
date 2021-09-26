package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import manager.domain.ManagerVO;
import manager.persistence.ManagerDAOMyBatis;
import prof.domain.ProfessorVO;
import prof.persistence.ProfessorDAOMyBatis;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class InfoEditEndAction2 extends AbstractAction {

	ManagerDAOMyBatis dao= new ManagerDAOMyBatis();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// ���� �޾ƿ���
		String ph1 = req.getParameter("ph1");
		String ph2 = req.getParameter("ph2");
		String ph3 = req.getParameter("ph3");
		String email = req.getParameter("email");

		if (ph1 == null || ph2 == null || ph3 == null || email == null || ph1.trim().isEmpty() || ph2.trim().isEmpty()
				|| ph3.trim().isEmpty() || email.trim().isEmpty()) {

			this.setRedirect(false);
			this.setViewPage("mypage1.do");
			return;
		}
		HttpSession ses = req.getSession();
		ManagerVO mvo= (ManagerVO) ses.getAttribute("mloginUser");

		String phone = ph1 + "-" + ph2 + "-" + ph3;
		int cnt = dao.editProfInfo(mvo.getMnum(), phone, email);

		String msg = (cnt > 0) ? "수정성공" : "수정실패";
		String loc = (cnt > 0) ? "mypage.do" : "javascript:history.back()";

		this.setRedirect(false);
		this.setViewPage(CommonUtil.addMsgLoc(req, msg, loc));

	}

}
