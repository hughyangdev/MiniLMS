package prof.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import prof.domain.ClassListVO;
import prof.domain.ScoreVO;
import prof.domain.ScoreViewVO;
import prof.persistence.ClassListDAOMyBatis;
import prof.persistence.ProfessorDAOMyBatis;
import student.domain.StudentVO;

public class InsertScoreAction extends AbstractAction {

	ClassListDAOMyBatis cdao=new ClassListDAOMyBatis();
	ProfessorDAOMyBatis dao=new ProfessorDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		List<ScoreViewVO> sList=cdao.studentListByClass();
		List<ClassListVO> cList=cdao.classByProf(1021);
		//1. 학번, 점수 받아오기
		String sNumStr=req.getParameter("infSnum");
		int sNum=Integer.parseInt(sNumStr);
		String lNameStr=req.getParameter("infLnum");
		int lNum=Integer.parseInt(lNameStr);
		String scoreStr=req.getParameter("infScore");
		int score=Integer.parseInt(scoreStr);
		
		//2. 유효성 체크
			ScoreVO scoreVo=new ScoreVO();
			scoreVo.setlNum(lNum);
			scoreVo.setsNum(sNum);
			scoreVo.setScore(score);
			
			dao.insertScore(scoreVo);
			
			req.setAttribute("scoreVo", scoreVo);
			
//			this.setRedirect(false);
//			this.setViewPage("insertScore.jsp");
//			return;
		
		//교번 알아내기
//		HttpSession ses=req.getSession();
//		//ProfessorVO loginUser=(ProfessorVO)ses.getAttribute("loginUser");
//		//int pNum=loginUser.getpNum();//교번
		
		String view="insertScore.jsp";
		this.setViewPage(view);
		this.setRedirect(false);

	}

}
