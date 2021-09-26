package prof.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import prof.domain.ClassListVO;
import prof.domain.ProfessorVO;
import prof.persistence.ClassListDAOMyBatis;

public class ClassListAction extends AbstractAction {

	ClassListDAOMyBatis cdao=new ClassListDAOMyBatis();
	
   public void execute(HttpServletRequest req, HttpServletResponse res)
   throws Exception{
      System.out.println("ClassListAction의 execute()...");
      
      // 세션에서 교번 가져오기
      HttpSession ses = req.getSession();
      ProfessorVO vo = (ProfessorVO)ses.getAttribute("ploginUser");
      int pnum=vo.getPnum();
      System.out.println("vo.pnum== "+pnum);
      
      
      List<ClassListVO> cList=cdao.classByProf(pnum);
      req.setAttribute("cList", cList);
      
      this.setViewPage("classList.jsp"); //              
      this.setRedirect(false); //  ̵       forward  ̵          
      
   }

}/////////////////