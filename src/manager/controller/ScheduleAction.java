package manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import manager.domain.ScheduleVO;
import manager.persistence.ScheduleDAOMyBatis;

public class ScheduleAction extends AbstractAction {

	ScheduleDAOMyBatis dao = new ScheduleDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		List<ScheduleVO> list = dao.scheduleList();
		
		req.setAttribute("allSchedule", list);
		
		this.setViewPage("/manager/schedule.jsp");
		this.setRedirect(false);
	} //execute()--------

}/////////////////////
