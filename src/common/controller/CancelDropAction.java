package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class CancelDropAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("CancelDropAciton의 execute...");
		HttpSession session = req.getSession();
		StudentVO svo = (StudentVO) session.getAttribute("loginUser");
		int snum = svo.getSnum();

		StudentDAOMyBatis dao = new StudentDAOMyBatis();

		int n = dao.changeUserStateAgain(snum);

		String msg = (n > 0) ? "다시 일반회원으로 전환되었습니다. 다시 로그인 하세요" : "전환 처리 실패";
		String loc = (n > 0) ? "login.do" : "javascript:history.back()";

		this.setRedirect(false);
		this.setViewPage(CommonUtil.addMsgLoc(req, msg, loc));

	}

}
