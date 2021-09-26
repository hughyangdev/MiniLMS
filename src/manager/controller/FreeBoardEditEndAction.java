package manager.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.persistence.FreeBoardDAOMyBatis;
import common.base.CommonUtil;
import common.controller.AbstractAction;

public class FreeBoardEditEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		ServletContext application = req.getServletContext();
		String upDir = application.getRealPath("/Upload");
		MultipartRequest mr = null;
		try {
			DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
			mr = new MultipartRequest(req, upDir, 10 * 1024 * 1024, "UTF-8", df);
		} catch (IOException e) {
			req.setAttribute("message", "파일 업로드 실패: 용량은 10M까지 가능");
			req.setAttribute("loc", "javascript:history.back()");
			this.setViewPage("../msg.jsp");
			this.setRedirect(false);
			e.printStackTrace();
			return;
		}
		String num = mr.getParameter("num");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		System.out.println(num + "/" + title + "/" + content);

		FreeBoardDAOMyBatis dao = new FreeBoardDAOMyBatis();

		int n = dao.updateBoard(title, content, num);

		String msg = (n > 0) ? "수정성공" : "수정 실패";
		String loc = (n > 0) ? "freeboardlist.do" : "javascript:history.back()";

		this.setRedirect(false);
		this.setViewPage(CommonUtil.addMsgLoc(req, msg, loc));
	}

}
