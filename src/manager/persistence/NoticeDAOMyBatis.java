package manager.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.base.DAOMyBatisBase;
import manager.domain.NoticeVO;

public class NoticeDAOMyBatis extends DAOMyBatisBase {

	private final String NS = "manager.mapper.NoticeMapper";
	private SqlSession ses;

	/** 공지사항 글 작성하는 메소드 */
	public int noticeInsert(NoticeVO nlist) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.insert(NS + ".noticeInsert", nlist);
			return n;
		} finally {
			close(ses);
		}
	} // noticeInsert()---------------
	
	/** 공지사항 글 수 불러오는 메소드 */
	public int getTotalCount() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS+".getTotalCount");
			return n;
		} finally {
			close(ses);
		}
	} //getTotalCount()----------
	
	/** 공지사항 글 불러오는 메소드 */
	public List<NoticeVO> getAllNoticeIndex() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<NoticeVO> arr = ses.selectList(NS + ".getAllNoticeIndex");
			return arr;
		} finally {
			close(ses);
		}
	} // getNoticeList()--------------

	/** 공지사항 글 불러오는 메소드(페이징) */
	public List<NoticeVO> getAllNotice(int start, int end) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			
			Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			
			List<NoticeVO> arr = ses.selectList(NS + ".getAllNotice", map);
			return arr;
		} finally {
			close(ses);
		}
	} // getNoticeList()--------------

	/** 공지사항 검색 정보 불러오는 메소드 */
	public List<NoticeVO> getFindNotice(String ntitle) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<NoticeVO> arr = ses.selectList(NS + ".getFindNotice", ntitle);
			return arr;
		} finally {
			close(ses);
		}
	} // getFindNotice()--------------

	/** 공지사항 조회수 증가 메소드 */
	public boolean updateReadnum(int nnum) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.update(NS+".updateReadnum", nnum);
			return (n>0)? true: false;
		} finally {
			close(ses);
		}
	} //updateReadnum()---------

	/** 글번호로 공지사항 내용 가져오는 메소드 */
	public NoticeVO noticeView(int nnum) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			NoticeVO nvo = ses.selectOne(NS+".noticeView", nnum);
			return nvo;
		} finally {
			close(ses);
		}
	} //noticeView()--------

	public int deleteNotice(int nnum) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.delete(NS+".deleteNotice", nnum);
			return n;
		} finally {
			close(ses);
		}
	} //deleteNotice()-------

	public int updateNotice(NoticeVO notice) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.update(NS+".updateNotice", notice);
			return n;
		} finally {
			close(ses);
		}
	} //updateNotice()-------

}
