package prof.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import prof.domain.ClassListVO;
import prof.persistence.ClassListDAOMyBatis;

public class EvaluSearchAction extends AbstractAction {
	
	ClassListDAOMyBatis dao = new ClassListDAOMyBatis();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		// ���� �޾ƿ���
		String pnum = req.getParameter("pnum");
		// �˻��� �޾ƿ���
		String searchName = req.getParameter("searchName");
		
		// ��ȿ�� üũ
		if(pnum==null || pnum.trim().isEmpty() || 
				searchName==null || searchName.trim().isEmpty()) {
			searchName = (String)session.getAttribute("searchName");
			pnum = (String)session.getAttribute("pnum");
		}
		
		session.setAttribute("pnum", pnum);
		session.setAttribute("searchName", searchName);
		
		// �˻��� �Խù� �� ��������
		int totalCount = dao.getFindCountBySearchName(pnum, searchName);
		//System.out.println(totalCount);
		
		// ����¡ ó��
		String cpStr =req.getParameter("cpage");
	     if(cpStr==null||cpStr.trim().isEmpty()) {
	         cpStr= "1";
	     }
		
	    int cpage = Integer.parseInt(cpStr);
	    String a = req.getParameter("pageSize3");
	    
	    if(a==null||a.trim().isEmpty()) {
	         a =(String)session.getAttribute("pageSize3");
	         if(a == null) {
	            a = "5";
	         }
	      }
	    
	    session.setAttribute("pageSize3", a);
	    
	    int pageSize3 = Integer.parseInt(a.trim());
	    
	    int pageCount3 = (totalCount - 1)/pageSize3 +1;
	      if(cpage < 1) {
	         cpage=1;
	      }
	      if(cpage > pageCount3) {
	         cpage=pageCount3;
	      }
	      int end= cpage * pageSize3;
	      int start =end - (pageSize3 -1);
	      
	     // �˻��� ���Ǹ� ������ ��������
	     List<ClassListVO> arr = dao.getFindClassListByPnum(start, end, pnum, searchName);
	     //System.out.println("arr"+arr);
	     
	     
	     int pagingBlock3 =5;
		 int prevBlock3 = 0; 
		 int nextBlock3 =0;
		 
		 prevBlock3 = (cpage-1)/pagingBlock3*pagingBlock3;
		 nextBlock3 = prevBlock3+(pagingBlock3+1);
		 
		 req.setAttribute("totalCount", totalCount);
	      req.setAttribute("classList", arr);
	      req.setAttribute("pageCount3", pageCount3);
	      req.setAttribute("cpage", cpage);
	      req.setAttribute("pagingBlock3", pagingBlock3);
	      req.setAttribute("prevBlock3", prevBlock3);
	      req.setAttribute("nextBlock3", nextBlock3);
	      req.setAttribute("searchName", searchName);
	    
		
		
		this.setRedirect(false);
		this.setViewPage("EvaluSearch.jsp");
		
		
		
		

	}

}
