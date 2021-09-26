package prof.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import prof.domain.ProfessorVO;
import prof.persistence.ProfessorDAOMyBatis;
import student.domain.RegistClassVO;

public class CheckClassAction extends AbstractAction {
	
	ProfessorDAOMyBatis dao = new ProfessorDAOMyBatis();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		// 교수 번호 가져오기
		HttpSession session = req.getSession();
		ProfessorVO loginUser = (ProfessorVO) session.getAttribute("ploginUser");
		int pnum = loginUser.getPnum();
		
		// 수강신청한 학생의 수강신청 리스트 가져오기
		List<RegistClassVO> rList = dao.getAllClassByPnum(pnum);
		//System.out.println("rList.size()="+rList.size());
		
		
		session.setAttribute("rList", rList);
		
		
		
		
		this.setRedirect(false);
		this.setViewPage("checkClass.jsp");
		
	}

}
