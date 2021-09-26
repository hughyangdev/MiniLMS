package board.persistence;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.domain.BoardVO;
import common.base.DAOMyBatisBase;

public class FreeBoardDAOMyBatis extends DAOMyBatisBase {

	private final String NS = "board.mapper.BoardMapper";
	private SqlSession ses;

	public int addWrite(BoardVO wvo) {
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.insert(NS + ".addWrite", wvo);
			return n;
		} finally {
			close(ses);
		} // finally-------------
	}

	public List<BoardVO> getAllBoard() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<BoardVO> bList = ses.selectList(NS + ".getAllBoard");
			return bList;
		} finally {
			close(ses);
		}
	}

	public int getTotalCount() throws SQLException {
		try {
			ses = this.getSqlSessionFactory().openSession();
			String sql = "select count(idx) cnt from board";
			return 0;
		} finally {
			close(ses);
		}
	}

	public int deleteBoard(int bnum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.delete(NS + ".deleteBoard", bnum);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public BoardVO getMyBoard(int bnum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			BoardVO bvo = ses.selectOne(NS + ".getMyBoard", bnum);
			return bvo;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

	public int updateBoard(String bTitle, String bContents, String bnum) {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession(true);
			Map<Object, Object> map = new HashMap<>();
			map.put("title", bTitle);
			map.put("content", bContents);
			map.put("bnum", Integer.parseInt(bnum));
			int n = ses.update(NS + ".updateBoard", map);
			return n;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}
	
	public List<BoardVO> getBoardByDate() {
		// TODO Auto-generated method stub
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<BoardVO> board = ses.selectList(NS + ".getBoardByDate");
			return board;
		} finally {
			// TODO: handle finally clause
			close(ses);
		}
	}

}/////////////////////////
