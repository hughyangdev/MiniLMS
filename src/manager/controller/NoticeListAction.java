package manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import manager.domain.NoticeVO;
import manager.persistence.NoticeDAOMyBatis;

public class NoticeListAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String cpStr = req.getParameter("cpage");
		if(cpStr==null || cpStr.trim().isEmpty()) {
			cpStr = "1";
		}
		int cpage = Integer.parseInt(cpStr);
		
		NoticeDAOMyBatis ndao = new NoticeDAOMyBatis();
		
		int totalCount = ndao.getTotalCount();
		int pageSize = 5;
		
		int pageCount = (totalCount-1) / pageSize +1;
		if(cpage<1) {
			cpage = 1;
		}
		if(cpage>pageCount) {
			cpage = pageCount;
		}
		
		int end = cpage * pageSize;
		int start = end - (pageSize-1);
		
		List<NoticeVO> noticeArr = ndao.getAllNotice(start, end);
		System.out.println("noticeArr: "+noticeArr.size());
		
		int pagingBlock = 5;
		int prevBlock = 0, nextBlock = 0;
		
		prevBlock = (cpage-1) / pagingBlock * pagingBlock;
		nextBlock = prevBlock + (pagingBlock+1);
		
		req.setAttribute("noticeArr", noticeArr);
		
		req.setAttribute("cpage", cpage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pagingBlock", pagingBlock);
		req.setAttribute("prevBlock", prevBlock);
		req.setAttribute("nextBlock", nextBlock);
		
		this.setViewPage("/manager/noticelist.jsp");
		this.setRedirect(false);
	}

}
