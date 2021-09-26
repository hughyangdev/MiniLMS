package student.persistence;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.base.DAOMyBatisBase;
import common.exception.NotUserException;
import student.domain.ClassListVO;
import student.domain.RegistClassVO;
import student.domain.StopSemesterVO;
import student.domain.StudentVO;

public class StudentDAOMyBatis extends DAOMyBatisBase {

	private final String NS = "student.mapper.StudentMapper";
	private SqlSession ses;

	public int addStudent(StudentVO svo) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			// System.out.println(ses);
			int n = ses.insert(NS + ".addStudent", svo);
			return n;
		} finally {
			close(ses);
		} // finally----------------
	}// addStudent-------------------

	public StudentVO loginCheck(String userid, String pwd) throws SQLException, NotUserException {
		StudentVO user = this.selectUserByUserid(userid);
		if (user == null) {
			// 아이디가 존재하지 않을 경우
			throw new NotUserException(userid + "란 아이디는 존재하지 않습니다.");
		}
		// 비번 체크
		if (!pwd.equals(user.getSpwd())) {
			throw new NotUserException("비밀번호가 일치하지 않습니다.");
		}
		return user;
	} // loginCheck End

	private StudentVO selectUserByUserid(String userid) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			StudentVO svo = ses.selectOne(NS + ".selectUserByUserid", userid);
			return svo;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}// selectUserByUserid end

	public StudentVO selectStudentBySNum(String snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			int num = Integer.parseInt(snum);
			StudentVO svo = ses.selectOne(NS + ".selectStduentBySnum", num);
			return svo;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public boolean idCheck(String userid) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int cnt = ses.selectOne(NS + ".idCheck", userid);
			boolean bool = (cnt == 0) ? true : false;
			return bool;
		} finally {
			close(ses);
		}
	}

	public int registerRest(StopSemesterVO ssvo) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.insert(NS + ".registerRest", ssvo);
			if (n > 0)
				ses.commit();// 트랜잭션 처리
			else
				ses.rollback();
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public StopSemesterVO selectRestBySnum(int snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			StopSemesterVO ssvo = ses.selectOne(NS + ".checkRestBySnum", snum);
			return ssvo;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int getTotalSubCount() {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getTotalSubCount");
			return n;

		} finally {
			close(ses);
		}
	}

	public List<ClassListVO> selectSubject(String subjectName, int start, int end) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("subjectName", subjectName);
			map.put("start", start);
			map.put("end", end);

			List<ClassListVO> subList = ses.selectList(NS + ".selectSubject", map);
			return subList;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int editProfInfo(int snum, String phone, String email) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("snum", snum);
			map.put("phone", phone);
			map.put("email", email);

			int n = ses.update(NS + ".editProfInfo", map);
			return n;

		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int deleteRest(String snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int num = Integer.parseInt(snum);

			int n = ses.delete(NS + ".deleteRest", num);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int registerClass(String registerSub, String registerSnum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int snum = Integer.parseInt(registerSnum);

			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("subject", registerSub);
			map.put("snum", snum);

			int n = ses.insert(NS + ".registerClass", map);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public List<RegistClassVO> getAllMyClass(int snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<RegistClassVO> rList = ses.selectList(NS + ".getAllMyClass", snum);
			return rList;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int deleteClass(String snum, String lname) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int num = Integer.parseInt(snum);

			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("snum", num);
			map.put("lname", lname);

			int n = ses.delete(NS + ".deleteClass", map);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public List<RegistClassVO> getMyClassGrade(int snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<RegistClassVO> myList = ses.selectList(NS + ".getMyClassGrade", snum);
			return myList;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int getClassCount(int snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getClassCount", snum);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int getAllClassCount(int snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.selectOne(NS + ".getAllClassCount", snum);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

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

	public List<RegistClassVO> selectCompleteClassForTable(int snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();

			List<RegistClassVO> rList = ses.selectList(NS + ".selectCompleteClassForTable", snum);
			return rList;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}
	
	public int changeUserState(int snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.update(NS + ".changeUserState", snum);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int changeUserStateAgain(int snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.update(NS + ".changeUserStateAgain", snum);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public List<RegistClassVO> getMyClassForCheck(int snum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<RegistClassVO> rList = ses.selectList(NS + ".getMyClassForCheck", snum);
			return rList;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public List<ClassListVO> selectSubjectByProf(String subjectName, int start, int end) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("subjectName", subjectName);
			map.put("start", start);
			map.put("end", end);

			List<ClassListVO> subList = ses.selectList(NS + ".selectSubjectByProf", map);
			return subList;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

}////////////////////////////////////////
