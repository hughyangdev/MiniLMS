package prof.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.base.DAOMyBatisBase;
import prof.domain.ClassListVO;
import prof.domain.ScoreViewVO;
import student.domain.StudentVO;

public class ClassListDAOMyBatis extends DAOMyBatisBase {

	private final String NS = "common.mapper.ClassListMapper";
	private SqlSession ses;

	/** ���� ���� ����Ʈ�� �������� �޼ҵ� */
	public List<ClassListVO> selectByClassList() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<ClassListVO> arr = ses.selectList(NS + ".selectByClassList");

			return arr;

		} finally {
			close(ses);
		}
	} // --------------------------
	
	// 교번으로 총 강의 페이지 수 찾는 메소드
		public int getMyTotalClassCount(String pnum) {
			try {
				ses = this.getSqlSessionFactory().openSession();
				int n = ses.selectOne(NS+".getMyTotalClassCount", pnum);
				
				return n;
				
			} finally {
				close(ses);
			}
		}
		
		public List<ClassListVO> getMyClassList(int start, int end, String pnum) {
			
			try {
				  ses = this.getSqlSessionFactory().openSession();
				  
				  Map<String, Object> map = new HashMap<String, Object>();

				  map.put("start", start);
				  map.put("end", end);
				  map.put("pnum", pnum);
				  
				  List<ClassListVO> arr = ses.selectList(NS+".getMyClassList", map);
				  
				  return arr;
		  
		 } finally {
			 close(ses);
			 
		 	}
			
		}

	public int getTotalSubCount() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getTotalSubCount");

			return n;

		} finally {
			close(ses);
		}
	}

	public List<ClassListVO> listClass(int start, int end) {
		try {
			ses = this.getSqlSessionFactory().openSession();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("start", start);
			map.put("end", end);

			List<ClassListVO> arr = ses.selectList(NS + ".listClass", map);

			return arr;

		} finally {
			close(ses);

		}

	}

	/** ���Ǹ� �����ϴ� �л� ��� �������� */
	public List<ScoreViewVO> studentListByClass() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<ScoreViewVO> arr = ses.selectList(NS + ".studentListByClass");
			return arr;
		} finally {
			close(ses);
		}
	}

	/** ������ �������� ���� */
	public List<ClassListVO> classByProf(int pnum) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<ClassListVO> arr = ses.selectList(NS + ".classByProf", pnum);
			return arr;
		} finally {
			close(ses);
		}
	}

	public List<ClassListVO> getMyClassList(int start, int end, int pnum) {

		try {
			ses = this.getSqlSessionFactory().openSession();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("pnum", pnum);

			List<ClassListVO> arr = ses.selectList(NS + ".getMyClassList", map);
			return arr;

		} finally {
			close(ses);
		}
	}

	// �������� �� ���� ������ �� ã�� �޼ҵ�
	public int getMyTotalClassCount(int pnum) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getMyTotalClassCount", pnum);
			return n;
		} finally {
			close(ses);
		}
	}

	public List<ClassListVO> getFindClassList(int start, int end, String lname, String type) {
		try {
			ses = this.getSqlSessionFactory().openSession();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("lname", lname);
			map.put("type", type);

			List<ClassListVO> arr = ses.selectList(NS + ".getFindClassList", map);
			return arr;
		} finally {
			close(ses);
		}
	}

	public int getFindCount(String lname) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getFindCount", lname);
			return n;
		} finally {
			close(ses);
		}
	}

	public int getFindCountByProf(String lname) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getFindCountByProf", lname);
			return n;
		} finally {
			close(ses);
		}
	}

	public int getFindCountBySearchName(String pnum, String searchName) {
		try {
			ses = this.getSqlSessionFactory().openSession();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pnum", pnum);
			map.put("searchName", searchName);

			int n = ses.selectOne(NS + ".getFindCountBySearchName", map);
			return n;
		} finally {
			close(ses);
		}
	}

	public List<ClassListVO> getFindClassListByPnum(int start, int end, String pnum, String searchName) {
		try {
			ses = this.getSqlSessionFactory().openSession();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("pnum", pnum);
			map.put("searchName", searchName);

			List<ClassListVO> arr = ses.selectList(NS + ".getFindClassListByPnum", map);
			return arr;
		} finally {
			close(ses);
		}
	}

	///////////// ���� ���� ���� �޼ҵ� ////////////////
}
