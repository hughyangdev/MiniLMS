package manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.domain.BoardVO;
import board.persistence.FreeBoardDAOMyBatis;
import common.controller.AbstractAction;

public class FreeBoardEditAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		FreeBoardDAOMyBatis dao = new FreeBoardDAOMyBatis();
		int bnum = Integer.parseInt(req.getParameter("editNum"));

		BoardVO bvo = dao.getMyBoard(bnum);

		req.setAttribute("bvo", bvo);
		this.setViewPage("manager/freeboardForUpdate.jsp");
		this.setRedirect(false);

	}

}
