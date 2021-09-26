package prof.persistence;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.base.DAOMyBatisBase;
import common.exception.NotUserException;
import prof.domain.ProfessorVO;
import prof.domain.ScoreVO;
import prof.domain.ScoreViewVO;
import student.domain.RegistClassVO;

public class ProfessorDAOMyBatis extends DAOMyBatisBase {

	private final String NS = "prof.mapper.ProfessorMapper";
	private SqlSession ses;

	public int addProfessor(ProfessorVO pvo) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.insert(NS + ".addProfessor", pvo);
			return n;
		} finally {
			close(ses);
		} // finally-------------
	}// addProfessor-----------------

	public ProfessorVO loginCheck(String userid, String pwd) throws SQLException, NotUserException {
		ProfessorVO user = this.selectUserByUserid(userid);
		if (user == null) {
			// 아이디가 존재하지 않을 경우
			throw new NotUserException(userid + "란 아이디는 존재하지 않습니다.");
		}
		// 비번 체크
		if (!pwd.equals(user.getPpwd())) {
			throw new NotUserException("비밀번호가 일치하지 않습니다");
		}
		return user;
	}

	private ProfessorVO selectUserByUserid(String userid) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			ProfessorVO pvo = ses.selectOne(NS + ".selectUserByUserid", userid);
			return pvo;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}
	
	public ProfessorVO selectProfInfo() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			ProfessorVO pvo = ses.selectOne(NS + ".selectProfInfo");

			return pvo;

		} finally {
			close(ses);
		}
	}

	/** 회원정보 수정하는 메소드 */
	public int editProfInfo(ProfessorVO pvo) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int num = ses.update(NS + ".editProfInfo", pvo);
			return num;

		} finally {
			close(ses);
		}
	}

	////////////// 성적입력 관련 메소드//////////////////
	/** 점수를 입력하는 메소드 */
	public int insertScore(ScoreVO scoreVo) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.insert(NS + ".insertScore", scoreVo);
			return n;
		} finally {
			close(ses);
		}
	}
	////////////// 성적입력 관련 메소드//////////////////

	public int changePwd(int num, String pwd) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("num", num);
			map.put("pwd", pwd);

			int n = ses.update(NS + ".changePwd", map);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	
	/** 점수를 수정하는 메소드 */
	public int updateScore(ScoreViewVO scoreView) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.insert(NS + ".updateScore", scoreView);
			return n;
		} finally {
			close(ses);
		}
	}

	/** 수강신청한 학생 목록 가져오는 메소드*/
	public List<RegistClassVO> getAllClassByPnum(int pnum) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<RegistClassVO> list = ses.selectList(NS+".getAllClassByPnum", pnum);
			return list;
		} finally {
			close(ses);
		}
	}

	/**수강신청한 학생의 수강상태 변경하는 메소드*/
	public int changeRstate(String lnum1, String snum1) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			
			int lnum = Integer.parseInt(lnum1);
			int snum = Integer.parseInt(snum1);
			
			Map<String, Integer> map = new HashMap<>();
			map.put("lnum", lnum);
			map.put("snum", snum);
			
			int n = ses.update(NS+".changeRstate", map);
			return n;
		} finally {
			close(ses);
		}
	}

	public int returnRstate(String lnum1, String snum1) {
		ses = this.getSqlSessionFactory().openSession(true);
		
		int lnum = Integer.parseInt(lnum1);
		int snum = Integer.parseInt(snum1);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("lnum", lnum);
		map.put("snum", snum);
		
		int n = ses.update(NS+".returnRstate", map);
		return n;
	}

	// 강의를 수강하는 학생 수 가져오기
	public int getClassStudentCount(int lnum) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int count = ses.selectOne(NS+".getClassStudentCount", lnum);
			return count;
			
		} finally {
			close(ses);
		}
	}

	// 강의를 수강하는 학생 목록 가져오기
	public List<RegistClassVO> getClassStudentByLnum(int lnum) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<RegistClassVO> list = ses.selectList(NS+".getClassStudentByLnum", lnum);
			return list;
		} finally {
			close(ses);
		}
	}

}////////////////////////////////
