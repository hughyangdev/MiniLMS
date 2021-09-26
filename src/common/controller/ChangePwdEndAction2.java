package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import manager.domain.ManagerVO;
import manager.persistence.ManagerDAOMyBatis;

public class ChangePwdEndAction2 extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub\

		ManagerDAOMyBatis dao = new ManagerDAOMyBatis();
		HttpSession session = req.getSession();

		String pwd = req.getParameter("newPwd");
		ManagerVO svo = (ManagerVO) session.getAttribute("mloginUser");

		int num = svo.getMnum();

		int n = dao.changePwd(num, pwd);

		String msg = (n > 0) ? "수정 성공" : "수정 실패";
		String loc = (n > 0) ? "../admin/mypage.do" : "javascript:history.back()";
		this.setViewPage(CommonUtil.addMsgLoc(req, msg, loc));
		this.setRedirect(false);

	}

}
