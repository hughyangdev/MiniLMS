package common.base;
import java.sql.*;
//���������� ���Ǵ� �ڵ� ���ȭ�� >> ������
public class DBUtil {
	
	private static String url="jdbc:oracle:thin:@localhost:1521:XE"; // XE:���� �����ͺ��̽� �̸�
	private static String user="school", pwd="tiger";
	//static ���� Ŭ���� �ε� Ÿ�ӿ� ���� ���� �޸𸮿� �ö󰡴� ����
	//main()�޼ҵ庸�ٵ� ���� �ö󰣴�.
	static {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("Driver Loading Success...");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}//static initializer
	
	public static Connection getCon() throws SQLException {
		Connection con=DriverManager.getConnection(url,user,pwd);
		return con;
	}
}
