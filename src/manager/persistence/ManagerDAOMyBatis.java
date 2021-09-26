package manager.persistence;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.base.DAOMyBatisBase;
import common.exception.NotUserException;
import manager.domain.ManagerVO;
import prof.domain.ProfessorVO;
import student.domain.StudentVO;

public class ManagerDAOMyBatis extends DAOMyBatisBase {

	private final String NS = "manager.mapper.ManagerMapper";
	private SqlSession ses;

	public int addManager(ManagerVO mvo) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.insert(NS + ".addManager", mvo);
			return n;
		} finally {
			close(ses);
		} // finally-----------------
	}// addStudent--------------------

	public ManagerVO loginCheck(String userid, String pwd) throws SQLException, NotUserException {
		ManagerVO user = this.selectUserByUserid(userid);
		if (user == null) {
			// 아이디가 존재하지 않을 경우
			throw new NotUserException(userid + "란 아이디는 존재하지 않습니다.");
		}
		// 비번 체크
		if (!pwd.equals(user.getMpwd())) {
			throw new NotUserException("비밀번호가 일치하지 않습니다.");
		}
		return user;
	}

	private ManagerVO selectUserByUserid(String userid) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			ManagerVO mvo = ses.selectOne(NS + ".selectUserByUserid", userid);
			return mvo;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	// 교수계정 보여주는 메소드
	public List<ProfessorVO> getProfList(int start, int end) {
		try {
			ses = this.getSqlSessionFactory().openSession();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("start", start);
			map.put("end", end);

			List<ProfessorVO> arr = ses.selectList(NS + ".getProfList", map);
			return arr;
		} finally {
			close(ses);
		}

	}

	public int getTotalProfCount() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getTotalProfCount");

			return n;

		} finally {
			close(ses);
		}
	}

	// 관리자 보여주는 메소드
	public List<ManagerVO> getAdminList(int start, int end) {
		try {
			ses = this.getSqlSessionFactory().openSession();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("start", start);
			map.put("end", end);

			List<ManagerVO> arr = ses.selectList(NS + ".getAdminList", map);
			return arr;

		} finally {
			close(ses);
		}

	}

	// 총 관리자 수 구하기
	public int getTotalAdminCount() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getTotalAdminCount");

			return n;

		} finally {
			close(ses);
		}
	}

	// 총 학생 수 구하기
	public int getTotalStudentCount() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getTotalStudentCount");

			return n;

		} finally {
			close(ses);
		}
	}

	// 학생 계정 보여주는 메소드
	public List<StudentVO> getStudentList(int start, int end) {
		try {
			ses = this.getSqlSessionFactory().openSession();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("start", start);
			map.put("end", end);

			List<StudentVO> arr = ses.selectList(NS + ".getStudentList", map);
			return arr;

		} finally {
			close(ses);
		}
	}

	public int editProfInfo(int mnum, String phone, String email) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("mnum", mnum);
			map.put("phone", phone);
			map.put("email", email);

			int n = ses.update(NS + ".editProfInfo", map);
			return n;

		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int changePwd(int num, String pwd) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("pwd", pwd);
			map.put("num", num);
			int n = ses.update(NS + ".changePwd", map);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

}/////////////////////////////////
