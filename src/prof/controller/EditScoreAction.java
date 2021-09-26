package prof.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import prof.persistence.ProfessorDAOMyBatis;

public class EditScoreAction extends AbstractAction {

	ProfessorDAOMyBatis pdao=new ProfessorDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub

	}

}
