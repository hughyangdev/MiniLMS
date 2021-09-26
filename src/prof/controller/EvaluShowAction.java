package prof.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import prof.persistence.ProfessorDAOMyBatis;
import student.domain.RegistClassVO;

public class EvaluShowAction extends AbstractAction {
	
	ProfessorDAOMyBatis dao = new ProfessorDAOMyBatis();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		// 강의 평가하는 강의 리스트 번호 가져오기
		String lNum = req.getParameter("lNum");
		int lnum = Integer.parseInt(lNum);
		
		// 강의를 수강신청한 학생들 리스트 가져오기
		
		
		// 강의 명 가져오기
		String lname = req.getParameter("lname");
		//System.out.println(lname);
		
		// 수강인원 구해오는 메소드
		int count = dao.getClassStudentCount(lnum);
		
		// 수강하는 학생 목록 가져오기
		List<RegistClassVO> list = dao.getClassStudentByLnum(lnum);
		
		req.setAttribute("lname", lname);
		req.setAttribute("count", count);
		
		req.setAttribute("list", list);
		
		this.setRedirect(false);
		this.setViewPage("evaluForm2.jsp");

	}

}
