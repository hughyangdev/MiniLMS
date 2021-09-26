package student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import student.domain.ClassListVO;
import student.persistence.StudentDAOMyBatis;

public class SearchSubResultAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("SearchSubResultAction의 execute()...");
		StudentDAOMyBatis dao = new StudentDAOMyBatis();
		String cpStr = req.getParameter("pagenavi");
		String subjectName = req.getParameter("subName");

		if (cpStr == null || cpStr.trim().isEmpty()) {
			cpStr = "1";
		}
		int cpage = Integer.parseInt(cpStr.trim());
		if (cpage <= 0) {
			cpage = 1;
		}

		int totalCount = dao.getTotalSubCount();
		int pageSize = 10;
		int end = cpage * pageSize;
		int start = end - (pageSize - 1);

		int pagingBlock = 5;
		int prevBlock = 0, nextBlock = 0;

		prevBlock = (cpage - 1) / pagingBlock * pagingBlock;
		nextBlock = prevBlock + (pagingBlock + 1);

		int pageCount = 1;
		pageCount = (totalCount - 1) / pageSize + 1;

		if (cpage > pageCount) {
			cpage = pageCount; // ������ �������� �����ֵ��� �Ѵ�.
		}

		List<ClassListVO> subList = dao.selectSubject(subjectName, start, end);
		req.setAttribute("subList", subList);
		req.setAttribute("cpage", cpage);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("totalCount", totalCount);

		req.setAttribute("pagingBlock", pagingBlock);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("prevBlock", prevBlock);
		req.setAttribute("nextBlock", nextBlock);

		this.setViewPage("student/subjectList.jsp");
		this.setRedirect(false);
	}

}
