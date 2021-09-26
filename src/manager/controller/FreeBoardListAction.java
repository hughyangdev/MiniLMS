package manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.domain.BoardVO;
import board.persistence.FreeBoardDAOMyBatis;
import common.controller.AbstractAction;

public class FreeBoardListAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String cpStr = req.getParameter("cpage");
		String psStr = req.getParameter("pageSize");
		if (cpStr == null || cpStr.trim().isEmpty()) {
			cpStr = "1";
		}
		HttpSession session = req.getSession();
		if (psStr == null || psStr.trim().isEmpty()) {
			psStr = (String) session.getAttribute("pageSize");
			if (psStr == null) {
				psStr = "5";
			}
		}
		session.setAttribute("pageSize", psStr);
		int cpage = Integer.parseInt(cpStr);
		int pageSize = 5;
		if (psStr != null) {
			pageSize = Integer.parseInt(psStr); // 한 페이지당 보여줄 게시글 수
		}

		// freeBoardDAO객체 생성해서 메소드 호출
		FreeBoardDAOMyBatis dao = new FreeBoardDAOMyBatis();
		// 총 게시글 수 가져오기
		int totalCount = dao.getTotalCount();
		int pageCount = (totalCount - 1) / pageSize + 1;
		if (cpage < 1) {
			cpage = 1;
		} else if (cpage > pageCount) {
			cpage = pageCount;
		}
		// DB에서 끊어오기 위한 변수(start, end)
		int end = pageSize * cpage;
		int start = end - pageSize + 1;

		List<BoardVO> bList = dao.getAllBoard();
		/*
		 * for (BoardVO bvo : bList) { System.out.println(bvo.getbPwd()); }
		 */
		req.setAttribute("bList", bList);
		req.setAttribute("cpage", cpage);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("totalCount", totalCount);

		this.setViewPage("/manager/freeboardlist2.jsp");
		this.setRedirect(false);
	}

}
