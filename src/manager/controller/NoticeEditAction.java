package manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import manager.domain.NoticeVO;
import manager.persistence.NoticeDAOMyBatis;

public class NoticeEditAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		NoticeDAOMyBatis ndao = new NoticeDAOMyBatis();
		
		String nnum = req.getParameter("edit");
		
		if(nnum==null||nnum.trim().isEmpty()) {
			this.setViewPage("noticeView.do");
			this.setRedirect(true);
			return;
		}
		
		NoticeVO notice = ndao.noticeView(Integer.parseInt(nnum));
		
		req.setAttribute("notice", notice);
		this.setViewPage("/manager/noticeEdit.jsp");
		this.setRedirect(false);

	} //execute()---------

} ////////////////////
