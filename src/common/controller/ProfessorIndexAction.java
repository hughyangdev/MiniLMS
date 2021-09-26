package common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.domain.BoardVO;
import board.persistence.FreeBoardDAOMyBatis;
import manager.domain.NoticeVO;
import manager.domain.ScheduleVO;
import manager.persistence.NoticeDAOMyBatis;
import manager.persistence.ScheduleDAOMyBatis;

public class ProfessorIndexAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setAttribute("msg", "TIS의 교수 페이지");
		
		NoticeDAOMyBatis ndao = new NoticeDAOMyBatis();
	    List<NoticeVO> notice = ndao.getAllNoticeIndex();
	    req.setAttribute("notice", notice);
		
		FreeBoardDAOMyBatis dao = new FreeBoardDAOMyBatis();
		List<BoardVO> board = dao.getBoardByDate();
		req.setAttribute("board", board);
		
		ScheduleDAOMyBatis schdao = new ScheduleDAOMyBatis();
		List<ScheduleVO> list = schdao.scheduleList();
		req.setAttribute("allSchedule", list);
		
		this.setViewPage("/index1.jsp"); //
		this.setRedirect(false);
	}

}
