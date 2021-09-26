package student.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class AccessClassEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("AccessClassAction의 execute()...");

		String aListSize = req.getParameter("aListSize");
		String profName = req.getParameter("profName");
		String subjectName = req.getParameter("subjectName");
		String complain = req.getParameter("complain");
		Map<String, String> score = new HashMap<String, String>();
		int n = Integer.parseInt(aListSize);

		for (int i = 1; i <= n; i++) {
			String qScore = req.getParameter("chk_access_" + i);
			score.put("score" + i, qScore);
		}
		
		/*
		 * for (int i = 1; i <= n; i++) { System.out.println(score.get("score" + i)); }
		 */
		
		

	}

}
