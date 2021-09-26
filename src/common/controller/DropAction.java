package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;

public class DropAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DropAction의 execute...");
		HttpSession session = req.getSession();
		StudentVO svo = (StudentVO) session.getAttribute("loginUser");
		int snum = svo.getSnum();

		StudentDAOMyBatis dao = new StudentDAOMyBatis();

		int n = dao.changeUserState(snum);

		String msg = (n > 0) ? "탈퇴처리가 완료되었습니다. 로그인 화면으로 돌아갑니다." : "탈퇴 처리 실패";
		String loc = (n > 0) ? "login.do" : "javascript:history.back()";

		this.setRedirect(false);
		this.setViewPage(CommonUtil.addMsgLoc(req, msg, loc));

	}

}
