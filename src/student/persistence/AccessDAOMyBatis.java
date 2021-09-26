package student.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.base.DAOMyBatisBase;
import student.domain.AccessmentVO;

public class AccessDAOMyBatis extends DAOMyBatisBase {

	private final String NS="student.mapper.AccessmentMapper";
	private SqlSession ses;
	
	public List<AccessmentVO> getAllQuestions() {
		// TODO Auto-generated method stub
		try {
			ses=this.getSqlSessionFactory().openSession();
			List<AccessmentVO> alist=ses.selectList(NS+".getAllQuestions");
			return alist;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}
	
	
	
}
