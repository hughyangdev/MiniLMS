package manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import manager.domain.ScheduleVO;
import manager.persistence.ScheduleDAOMyBatis;

public class ScheduleInsertAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// String schnum = req.getParameter("schnum");
		String schstartdate = req.getParameter("schstartdate");
		String schenddate = req.getParameter("schenddate");
		String schcontents = req.getParameter("schcontents");
		
		if(schstartdate==null||schstartdate.trim().isEmpty()||
				schenddate==null||schenddate.trim().isEmpty()||
				schcontents==null||schcontents.trim().isEmpty()) {
			this.setViewPage("/manager/schedule.jsp");
			this.setRedirect(true);
			return;
		}
		
		ScheduleVO scvo = new ScheduleVO(0, schstartdate, schenddate, schcontents);
		
		ScheduleDAOMyBatis dao = new ScheduleDAOMyBatis();
		
		int n = dao.scheduleInsert(scvo);
		
		String msg = (n>0)? "등록 성공": "등록 실패";
		String loc = (n>0)? "schedule.do": "javascript:history.back()";
		String viewPage = CommonUtil.addMsgLoc(req, msg, loc);
		
		this.setViewPage(viewPage); ///manager/schedule.jsp
		this.setRedirect(false);
	}

}//////////////////
