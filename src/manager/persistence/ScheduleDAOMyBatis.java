package manager.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.base.DAOMyBatisBase;
import manager.domain.ScheduleVO;

public class ScheduleDAOMyBatis extends DAOMyBatisBase {

	private final String NS = "manager.mapper.ScheduleMapper";
	private SqlSession ses;
	
	public List<ScheduleVO> scheduleList(){
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<ScheduleVO> list = ses.selectList(NS+".scheduleList");
			return list;
		} finally {
			close(ses);
		}
	} //scheduleList()---------

	public int scheduleInsert(ScheduleVO scvo) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.insert(NS + ".scheduleInsert", scvo);
			return n;
		} finally {
			close(ses);
		} 
	} //scheduleInsert()-------------
	
	public int scheduleUpdate(ScheduleVO scvo) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.update(NS+".scheduleUpdate", scvo);
			return n;
		} finally {
			close(ses);
		}
	} //scheduleUpdate()-----------
	
	public int scheduleDelete(int schnum) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.delete(NS+".scheduleDelete", schnum);
			return n;
		} finally {
			close(ses);
		}
	} //scheduleDelete()----------

	
	/*
	 * public ManagerVO loginCheck(String userid, String pwd) throws SQLException,
	 * NotUserException{ ManagerVO user = this.selectUserByUserid(userid);
	 * if(user==null) { //아이디가 존재하지 않을 경우 throw new
	 * NotUserException(userid+"란 아이디는 존재하지 않습니다."); } //비번 체크
	 * if(!pwd.equals(user.getMpwd())){ throw new
	 * NotUserException("비밀번호가 일치하지 않습니다."); } return user; }
	 */
	/*
	 * private ManagerVO selectUserByUserid(String userid) { // TODO Auto-generated
	 * method stub try { ses = this.getSqlSessionFactory().openSession(); ManagerVO
	 * mvo = ses.selectOne(NS + ".selectUserByUserid", userid); return mvo; }
	 * finally { // TODO: handle finally clause close(ses); } }
	 */

}/////////////////////////////////
