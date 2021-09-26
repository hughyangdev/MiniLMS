package manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import manager.domain.ScheduleVO;
import manager.persistence.ScheduleDAOMyBatis;

public class ScheduleUpdateAction extends AbstractAction {

	ScheduleDAOMyBatis dao = new ScheduleDAOMyBatis();
	 
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String schnum = req.getParameter("schnumE");
		String schcontents = req.getParameter("schcontentsE");
		String schstartdate = req.getParameter("schstartdateE");
		String schenddate = req.getParameter("schenddateE");
		System.out.println("schnum="+schnum+"schcontents="+schcontents+"schstartdate="+schstartdate+"schenddate="+schenddate);
		if(schnum==null||schcontents==null||schstartdate==null||schenddate==null||
				schnum.trim().isEmpty()||schcontents.trim().isEmpty()||schstartdate.trim().isEmpty()||schenddate.trim().isEmpty()) {
			this.setViewPage("/manager/schedule.jsp");
			this.setRedirect(true);
			return;
		} 
		
		int schnum_int = Integer.parseInt(schnum.trim());
		ScheduleVO list = new ScheduleVO(schnum_int, schstartdate, schenddate, schcontents);

		int n = dao.scheduleUpdate(list);
		String str = (n>0)? "일정 수정 성공": "수정 실패";
		String loc = (n>0)? "schedule.do": "javascript:history.back()";

		this.setViewPage(CommonUtil.addMsgLoc(req, str, loc));
		this.setRedirect(false);
	}

}//////////////////
