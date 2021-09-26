package prof.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import prof.domain.ClassListVO;
import prof.persistence.ClassListDAOMyBatis;
import sun.swing.SwingAccessor;

public class SubjectShowAction extends AbstractAction {

	ClassListDAOMyBatis dao = new ClassListDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		// 셀렉타입 받기
		String type = req.getParameter("findType");
		System.out.println("type1="+type);
		
		// 검색할 강의명 받기
		String lname = req.getParameter("lName");
		
		
				
		if(lname == null||lname.trim().isEmpty()) {
			lname = (String)session.getAttribute("lname");
		}
				
		session.setAttribute("lname", lname);	
		
		if(type == null||type.trim().isEmpty()) {
			type = (String)session.getAttribute("type");
		}
				
		session.setAttribute("type", type);	
		
		System.out.println("type="+type);
		
		int totalCount = 0;
		
		switch (type) {
		case "2":
			type = "lname";
			// 검색한 게시물 수 가져오기
			System.out.println("lname=="+lname);
			totalCount = dao.getFindCount(lname);
			System.out.println(totalCount);
			
			break;

		case "3":
			type = "(select pname from PROFESSOR where pnum = c.pnum)";
			totalCount = dao.getFindCountByProf(lname);
			break;
		default:
			break;
		}
		
		
		
		
		
		// 페이징 처리
		
		
		
		String cpStr =req.getParameter("cpage");
	     if(cpStr==null||cpStr.trim().isEmpty()) {
	         cpStr= "1";
	     }
		
	    int cpage = Integer.parseInt(cpStr);
	    String a = req.getParameter("pageSize2");
	    
	    if(a==null||a.trim().isEmpty()) {
	         a =(String)session.getAttribute("pageSize2");
	         if(a == null) {
	            a = "5";
	         }
	      }
	    
	    
	    session.setAttribute("pageSize2", a);

	    int pageSize2 = Integer.parseInt(a.trim());

		
	    int pageCount2 = (totalCount - 1)/pageSize2 +1;
	      if(cpage < 1) {
	         cpage=1;
	      }
	      if(cpage > pageCount2) {
	         cpage=pageCount2;
	      }
	      int end= cpage * pageSize2;
	      int start =end - (pageSize2 -1);
	      
	    
	   // 검색할 강의명 데이터 가져오기
		List<ClassListVO> arr = dao.getFindClassList(start, end, lname, type);  
		if(arr == null) {
			this.setRedirect(false);
			this.setViewPage("index.jsp");
			return;
		}
		
		
		int pagingBlock2 =5;
	    int prevBlock2 = 0; 
	    int nextBlock2 =0;
		
	    prevBlock2 = (cpage-1)/pagingBlock2*pagingBlock2;
	    nextBlock2 = prevBlock2+(pagingBlock2+1);
	    
	    req.setAttribute("totalCount", totalCount);
	      req.setAttribute("classList", arr);
	      req.setAttribute("pageCount2", pageCount2);
	      req.setAttribute("cpage", cpage);
	      req.setAttribute("pagingBlock2", pagingBlock2);
	      req.setAttribute("prevBlock2", prevBlock2);
	      req.setAttribute("nextBlock2", nextBlock2);
	      req.setAttribute("lname", lname);


		
		this.setRedirect(false);
		this.setViewPage("subjectList2.jsp");
	}

}
