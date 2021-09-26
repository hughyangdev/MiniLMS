package prof.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import prof.domain.ClassListVO;
import prof.domain.ProfessorVO;
import prof.persistence.ClassListDAOMyBatis;

public class EvaluationAction extends AbstractAction {
	
	ClassListDAOMyBatis dao = new ClassListDAOMyBatis();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		// 교번 가져오기
		HttpSession ses = req.getSession();
		ProfessorVO pvo = (ProfessorVO)ses.getAttribute("ploginUser");
		int pnum = pvo.getPnum();
		//System.out.println("pnum=- "+pnum);
		//System.out.println("pname= "+pvo.getPname());
		
		
		
		
		
		String cpStr = req.getParameter("cpage");
		if(cpStr == null || cpStr.trim().isEmpty()) {
			cpStr = "1";
		}
		
		int cpage = Integer.parseInt(cpStr.trim());
		if(cpage<=0) { // 음수나 0일 경우 1페이지
			cpage=1;
		}
		
		// 총 게시물 수 구하기
		int totalCount =  dao.getMyTotalClassCount(pnum);
		
		// 페이지 사이즈
		int pageSize = 10;
		
		// Db에서 끊어오기 위한 메소드
		int end = cpage*pageSize;
		int start = end - (pageSize-1);
		
		List<ClassListVO> list = dao.getMyClassList(start, end, pnum);
		
		int pagingBlock = 5; // 페이지를 5개 단위로 블럭 처리
		int prevBlock = 0, nextBlock = 0;
		
		prevBlock = (cpage -1)/pagingBlock * pagingBlock;
		nextBlock = prevBlock + (pagingBlock + 1);
		
		int pageCount = 1;
		pageCount = (totalCount-1)/pageSize+1;
		
		if(cpage>pageCount){
			cpage=pageCount; //마지막 페이지를 보여주도록 한다.
		}
		
		req.setAttribute("myClassList", list);
		
		req.setAttribute("cpage", cpage);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("totalCount", totalCount);
		
		req.setAttribute("pagingBlock", pagingBlock);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("prevBlock", prevBlock);
		req.setAttribute("nextBlock", nextBlock);
		
		
		this.setViewPage("evaluForm.jsp");
		this.setRedirect(false);

	}

}
