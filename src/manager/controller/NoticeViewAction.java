package manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import manager.domain.NoticeVO;
import manager.persistence.NoticeDAOMyBatis;

public class NoticeViewAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String nnum = req.getParameter("nnum");
		if(nnum==null || nnum.trim().isEmpty()) {
			this.setViewPage("noticeList.do");
			this.setRedirect(true);
			return;
		}
		
		NoticeDAOMyBatis ndao = new NoticeDAOMyBatis();
		boolean b = ndao.updateReadnum(Integer.parseInt(nnum.trim()));
		
		NoticeVO notice = ndao.noticeView(Integer.parseInt(nnum.trim()));
		
		req.setAttribute("notice", notice);
		
		this.setViewPage("../manager/noticeView.jsp");
		this.setRedirect(false);

	} //execute()---------

}
