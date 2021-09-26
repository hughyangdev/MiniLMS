package manager.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import manager.domain.NoticeVO;
import manager.persistence.NoticeDAOMyBatis;

public class NoticeEditEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/Upload");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, upDir, 10*1024*1024,
					"UTF-8", new DefaultFileRenamePolicy());
		} catch(IOException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		String nnum = mr.getParameter("nnum");
		String ntitle = mr.getParameter("ntitle");
		String nwriter = mr.getParameter("nwriter");
		String ncontents = mr.getParameter("ncontents");
		String nreference = mr.getFilesystemName("nreference");
		String originFilename = mr.getOriginalFileName("nreference");
		String old_filename = mr.getParameter("old_filename");

		System.out.println("nnum="+nnum+", ntitle="+ntitle+", nwriter="+nwriter
				+", ncontents="+ncontents+", nreference="+nreference
				+", originFilename="+originFilename+", old_filename="+old_filename);		
		
		if(nreference!=null) {
			if(old_filename!=null && !old_filename.trim().isEmpty()) {
				File oldFile = new File(upDir+File.separator+old_filename);
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		
		long filesize = 0;
		if(nreference!=null) {
			File file = mr.getFile("nreference");
			filesize = file.length();
		}
		
		if(nnum==null||nwriter==null||ntitle==null||
				nnum.trim().isEmpty()||nwriter.trim().isEmpty()||ntitle.trim().isEmpty()) {
			this.setViewPage("noticeEdit.do");
			this.setRedirect(true);
			return;
		}
		
		NoticeVO notice = new NoticeVO(nnum, null, nwriter, ntitle, ncontents, 
				null, 0, nreference, originFilename, filesize);
		
		NoticeDAOMyBatis ndao = new NoticeDAOMyBatis();
		int n = ndao.updateNotice(notice);
		String str = (n>0)? "수정 성공": "수정 실패";
		String loc = (n>0)? "noticeList.do": "javascript:history.back()";
		
		this.setViewPage(CommonUtil.addMsgLoc(req, str, loc));
		this.setRedirect(false);

	} //execute()-------

}//////////////////
