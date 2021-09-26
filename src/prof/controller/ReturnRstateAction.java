package prof.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import prof.persistence.ProfessorDAOMyBatis;

public class ReturnRstateAction extends AbstractAction {
	
	ProfessorDAOMyBatis dao = new ProfessorDAOMyBatis();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		// 강의번호
		String lnum = req.getParameter("lnum");
		// 학번
		String snum = req.getParameter("snum");
		System.out.println("lnum="+lnum + "snum="+snum);

		// 수강신청상태 변경하는 메소드
		int n = dao.returnRstate(lnum, snum);
		
		this.setViewPage("checkClass.do");
		this.setRedirect(true);
	}

}
