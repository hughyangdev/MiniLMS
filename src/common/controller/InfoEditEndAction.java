package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import prof.domain.ProfessorVO;
import prof.persistence.ProfessorDAOMyBatis;

public class InfoEditEndAction extends AbstractAction {

	ProfessorDAOMyBatis dao = new ProfessorDAOMyBatis();

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
			this.setViewPage("mypage.do");
			return;
		}

		String phone = ph1 + "-" + ph2 + "-" + ph3;

		System.out.println(phone + "/" + email);

		HttpSession session = req.getSession();
		ProfessorVO provo = (ProfessorVO) session.getAttribute("profInfo");

		provo.setPphone(phone);
		provo.setPemail(email);

		int cnt = dao.editProfInfo(provo);

		// ������ȣ �ٽ� ����
		String str = provo.getPphone();
		String[] pphone = str.split("-");

		session.setAttribute("phone", pphone);

		String msg = (cnt > 0) ? "수정성공" : "수정실패";
		String loc = (cnt > 0) ? "mypage.do" : "javascript:history.back()";

		this.setRedirect(false);
		this.setViewPage(CommonUtil.addMsgLoc(req, msg, loc));

	}

}
