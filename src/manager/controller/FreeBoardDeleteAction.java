package manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.persistence.FreeBoardDAOMyBatis;
import common.base.CommonUtil;
import common.controller.AbstractAction;

public class FreeBoardDeleteAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		// System.out.println("FreeBoardDeleteAction of executing....");
		FreeBoardDAOMyBatis dao = new FreeBoardDAOMyBatis();

		int bnum = Integer.parseInt(req.getParameter("deleteNum"));

		int n = dao.deleteBoard(bnum);

		this.setViewPage("freeboardlist.do");
		this.setRedirect(true);

	}

}
