package manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import manager.persistence.ScheduleDAOMyBatis;

public class ScheduleDeleteAction extends AbstractAction {

	ScheduleDAOMyBatis dao = new ScheduleDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String schnum = req.getParameter("schnumDel");
		if(schnum==null||schnum.trim().isEmpty()) {
			System.out.println("error 발생: "+schnum);
			this.setViewPage("/manager/schedule.jsp");
			this.setRedirect(true);
			return;
		}
		
		int n = dao.scheduleDelete(Integer.parseInt(schnum.trim()));
		
		String msg = (n>0)? "일정 삭제 성공": "삭제 실패";
		String loc = (n>0)? "schedule.do": "javascript:history.back()";
		String viewPage = CommonUtil.addMsgLoc(req, msg, loc);
		
		this.setViewPage(viewPage);
		this.setRedirect(false);
	}

}///////////
