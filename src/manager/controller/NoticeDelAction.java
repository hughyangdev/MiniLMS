package manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import manager.persistence.NoticeDAOMyBatis;

public class NoticeDelAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		NoticeDAOMyBatis ndao = new NoticeDAOMyBatis();
		
		int nnum = Integer.parseInt(req.getParameter("del"));
		
		int n = ndao.deleteNotice(nnum);
		
		this.setViewPage("noticeList.do");
		this.setRedirect(false);

	}

}/////////////////
