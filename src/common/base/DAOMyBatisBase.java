package common.base;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DAOMyBatisBase {

	/**����� ���� �޼ҵ�: SqlSessionFactory��ü�� ��ȯ�ϴ� �޼ҵ�*/
	public SqlSessionFactory getSqlSessionFactory() {
		String resource="common/config/mybatis-config.xml";
		//���赵 ������ �ϴ� ����(mybatisȯ�漳�� ����)
		InputStream is=null;
		try {
			is=Resources.getResourceAsStream(resource);
			SqlSessionFactoryBuilder builder=new SqlSessionFactoryBuilder();//���డ
			SqlSessionFactory factory=builder.build(is);//���� ����
			System.out.println(factory);
			return factory;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}//--------------------------
	public void close(SqlSession ses) {
		if(ses!=null) ses.close();
	}//-------------------------

}
