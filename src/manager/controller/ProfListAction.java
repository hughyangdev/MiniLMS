package manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import manager.persistence.ManagerDAOMyBatis;
import prof.domain.ProfessorVO;

public class ProfListAction extends AbstractAction {

	
	ManagerDAOMyBatis mdao = new ManagerDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String cpStr = req.getParameter("cpage");
		if(cpStr == null || cpStr.trim().isEmpty()) {
			cpStr = "1";
		}
		
		int cpage = Integer.parseInt(cpStr.trim());
		if(cpage<=0) { // 음수나 0일 경우 1페이지
			cpage=1;
		}
		
		// 총 게시물 수 구하기
		int totalCount =  mdao.getTotalProfCount();
				
		// 페이지 사이즈
		int pageSize = 5;
				
		// Db에서 끊어오기 위한 메소드
		int end = cpage*pageSize;
		int start = end - (pageSize-1);
		
		
		List<ProfessorVO> pList = mdao.getProfList(start, end);
		System.out.println("pList:  "+ pList.size());
		
		int pagingBlock = 5; // 페이지를 5개 단위로 블럭 처리
		int prevBlock = 0, nextBlock = 0;
		
		prevBlock = (cpage -1)/pagingBlock * pagingBlock;
		nextBlock = prevBlock + (pagingBlock + 1);
		
		int pageCount = 1;
		pageCount = (totalCount-1)/pageSize+1;
		
		if(cpage>pageCount){
			cpage=pageCount; //마지막 페이지를 보여주도록 한다.
		}
		
		
		req.setAttribute("profList", pList);
		
		req.setAttribute("cpage", cpage);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("totalCount", totalCount);
		
		req.setAttribute("pagingBlock", pagingBlock);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("prevBlock", prevBlock);
		req.setAttribute("nextBlock", nextBlock);
		
		
		
		
		
		this.setRedirect(false);
		this.setViewPage("/manager/profList.jsp");
		
	}

}
