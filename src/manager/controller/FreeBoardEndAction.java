package manager.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.domain.BoardVO;
import board.persistence.FreeBoardDAOMyBatis;
import common.base.CommonUtil;
import common.controller.AbstractAction;

public class FreeBoardEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("freeBoardEndAction excute() calling....");
		// 1. 사용자가 입력한 값 받기
		ServletContext application = req.getServletContext();
		String upDir = application.getRealPath("/Upload");
		MultipartRequest mr = null;
		try {
			DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
			mr = new MultipartRequest(req, upDir, 10*1024*1024, "UTF-8", df);
		} catch (IOException e) {
			req.setAttribute("message", "파일 업로드 실패: 용량은 10M까지 가능");
			req.setAttribute("loc", "javascript:history.back()");
			this.setViewPage("../msg.jsp");
			this.setRedirect(false);
			e.printStackTrace();
			return;
		}
		String bTitle = mr.getParameter("bTitle");
		String bWriter = mr.getParameter("bWriter");
		String bContents = mr.getParameter("bContents");
		String bPwd = mr.getParameter("bPwd");
		
		String bFile = mr.getFilesystemName("bFile");
		String originFilename = mr.getOriginalFileName("bFile");
		long filesize = 0;
		File file = mr.getFile("bFile");
		filesize = (file!=null)? file.length(): 0;

		System.out.println(bTitle + "/" + bWriter + "/" + bContents + "/" + bPwd);
		// 2. 유효성체체크 >>freeboard.do로 리다이렉트 이동
		if (bTitle == null || bWriter == null || bContents == null || bPwd == null || bTitle.trim().isEmpty()
				|| bWriter.trim().isEmpty() || bContents.trim().isEmpty() || bPwd.trim().isEmpty()) {

			this.setViewPage("freeboard.do");
			this.setRedirect(true);
			return;
		}

		int n = 0;
		//BoardVO wvo = new BoardVO(0, bTitle, bWriter, bContents, bPwd, null, bFile, originFilename, filesize);
		BoardVO wvo = new BoardVO(0, bTitle, bWriter, bContents, bPwd, null, bFile);
		FreeBoardDAOMyBatis dao = new FreeBoardDAOMyBatis();
		n = dao.addWrite(wvo);

		// 3. 결과 메시지 처리
		String msg = (n > 0) ? "등록 성공" : "등록 실패";
		String loc = (n > 0) ? "freeboardlist.do" : "javascript:history.back()";
		String view = CommonUtil.addMsgLoc(req, msg, loc);
		this.setViewPage(view);
		this.setRedirect(false);
	}
}
