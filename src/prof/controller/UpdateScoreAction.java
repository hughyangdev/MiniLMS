package prof.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import prof.domain.ClassListVO;
import prof.domain.ProfessorVO;
import prof.domain.ScoreViewVO;
import prof.persistence.ClassListDAOMyBatis;
import prof.persistence.ProfessorDAOMyBatis;

public class UpdateScoreAction extends AbstractAction {

	ClassListDAOMyBatis cdao=new ClassListDAOMyBatis();
	ProfessorDAOMyBatis pdao=new ProfessorDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		HttpSession ses = req.getSession();
//		ProfessorVO loginUser=(ProfessorVO)ses.getAttribute("loginUser");
//		int pnum=loginUser.getPnum();//교번
//		List<ClassListVO> cList=cdao.classByProf(pnum);
		
		//1. 학번, 점수 받아오기
		String sNumStr=req.getParameter("efSnum");
		int sNum=Integer.parseInt(sNumStr);
//		String lNameStr=req.getParameter("efLnum");
//		int lNum=Integer.parseInt(lNameStr);
		String scoreStr=req.getParameter("efScore");
		int score=Integer.parseInt(scoreStr);
		System.out.println("score"+score);
		
		//2. ScoreView에 점수 저장
		List<ScoreViewVO> sList=cdao.studentListByClass();
		ScoreViewVO scoreView=new ScoreViewVO();
//		scoreView.setlNum(lNum);
		scoreView.setsNum(sNum);
		scoreView.setScore(score);
		//System.out.println("lNum: "+scoreVo.getlNum()+", sNum: "+scoreVo.getsNum()+", score: "+scoreVo.getScore());
		int n = pdao.updateScore(scoreView);
		System.out.println("n: "+ n);
		System.out.println("점수: "+scoreView.getScore());
		

		this.setViewPage("studentByClass.do");
		this.setRedirect(false);

	}

}
