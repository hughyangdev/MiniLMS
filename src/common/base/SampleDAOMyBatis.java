package common.base;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SampleDAOMyBatis {
	
	//���ӽ����̽� ����. SampleMapper.xml�� ������ namespace���� �����ؾ� ��
	private final String NS="common.base.SampleMapper";
	
	/**����� ���� �޼ҵ�: SqlSessionFactory��ü�� ��ȯ�ϴ� �޼ҵ�*/
	public SqlSessionFactory getSqlSessionFactory() {
		String resource="common/config/mybatis-config.xml";
		//���赵 ������ �ϴ� ����(mybatisȯ�漳�� ����)
		InputStream is=null;
		try {
			is=Resources.getResourceAsStream(resource);
			SqlSessionFactoryBuilder builder=new SqlSessionFactoryBuilder();//���డ
			SqlSessionFactory factory=builder.build(is);//���� ����
			return factory;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}//--------------------------
	
	public int selectTableCount() {
		SqlSessionFactory factory=this.getSqlSessionFactory();
		//������ ���� ��ǰ�� ����
		SqlSession session=factory.openSession();
		try {
		int count=session.selectOne(NS+".tableCount");
		System.out.println("count="+count);
		return count;
		}finally {
			if(session!=null) session.close();
		}
	}//------------------------------

}
