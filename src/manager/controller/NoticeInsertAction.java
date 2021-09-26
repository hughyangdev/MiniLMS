package manager.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import manager.domain.NoticeVO;
import manager.persistence.NoticeDAOMyBatis;

public class NoticeInsertAction extends AbstractAction {

	@Override  
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 업로드할 디렉토리 절대경로 얻어오기
		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/Upload");
		System.out.println(upDir);
		
		// 파일 업로드 처리
		MultipartRequest mr = 
			new MultipartRequest(req, upDir, 10*1024*1024, 
				"UTF-8", new DefaultFileRenamePolicy());
		
		// 사용자가 입력한 값 받기
		String ntitle = mr.getParameter("ntitle");
		String nwriter = mr.getParameter("nwriter");
		String ncontents = mr.getParameter("ncontents");
		
		String nreference = mr.getFilesystemName("nreference");
		String originFilename = mr.getOriginalFileName("nreference");
		long filesize = 0;
		File file = mr.getFile("nreference");
		filesize = (file!=null)? file.length(): 0;
		
		if(ntitle==null || nwriter==null || ncontents==null
			|| ntitle.trim().isEmpty() || nwriter.trim().isEmpty() || ncontents.trim().isEmpty()) {
			this.setViewPage("notice.do");
			this.setRedirect(true);
			return;
		}
		
		// NoticeVO에 담아주기
		//NoticeVO nlist = new NoticeVO(null, null, nwriter, ntitle, ncontents, nreference, null);
		NoticeVO nlist = new NoticeVO(null, null, nwriter, ntitle, ncontents, 
			null, 0, nreference, originFilename, filesize);
		
		// DAO의 noticeInsert(VO) 호출
		NoticeDAOMyBatis dao = new NoticeDAOMyBatis();
		int n = dao.noticeInsert(nlist);
		
		String msg = (n>0)? "글 등록 성공": "글 등록 실패";
		String loc = (n>0)? "noticeList.do": "javascript:history.back()";
		
		String viewPage = CommonUtil.addMsgLoc(req, msg, loc);
		
		this.setViewPage(viewPage);
		this.setRedirect(false);
		
	} //execute()---------

}////////////////////
