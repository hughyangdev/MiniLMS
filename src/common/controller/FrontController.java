package common.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "*.do" }, initParams = {
		@WebInitParam(name = "config", value = "C:\\Myjava\\Workspace\\Final_Project5\\WebContent\\WEB-INF\\command.properties") })
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap<String, Object> cmdMap = new HashMap<>();
	// Commpand.properties�� �����Ǿ� �ִ� ������ �ؽ��ʿ� �ű� ����

	public void init(ServletConfig conf) throws ServletException {
		System.out.println("init()ȣ���...");
		String props = conf.getInitParameter("config");
		System.out.println("props=" + props);
		Properties pr = new Properties();

		try {
			FileInputStream fis = new FileInputStream(props);
			pr.load(fis);
			// Command.properties���� ������ Properties�� �Űܺ���.
			if (fis != null)
				fis.close();

			// pr�� key������ �����غ���.
			Enumeration<Object> en = pr.keys();
			while (en.hasMoreElements()) {
				String cmd = en.nextElement().toString();// key�� "/index.do"
				System.out.println("cmd=" + cmd);
				String className = pr.getProperty(cmd);// value�� "common.controller.IndexAction"
				if (className != null) {
					className = className.trim();
				}
				System.out.println("className=" + className);
				// className�� Ŭ������ �ν��Ͻ�ȭ
				Class<?> cls = Class.forName(className);
				Object cmdInstance = cls.newInstance();
				// �ش� Ŭ������ ��ü�� ��������
				////////////////////////
				cmdMap.put(cmd, cmdInstance);
				//////////////////////////
			} // while------------

		} catch (Exception e) {
			e.printStackTrace();
		}

	}// init()--------------------------------

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 1. Ŭ���̾�Ʈ�� ��û URI�� �м��غ���.
		String cmdUri = req.getServletPath(); // /index.do, /test.do
		System.out.println("cmdUri=" + cmdUri);
		Object instance = cmdMap.get(cmdUri);
		if (instance == null) {
			System.out.println("action이 null");
			throw new ServletException("Action이 null입니다.");
		}
		AbstractAction action = (AbstractAction) instance;

		try {
			///////////////////////
			action.execute(req, res);
			///////////////////////
			// execute������ ������ ������ �ڿ� ���������� �̵������ ����
			String viewPage = action.getViewPage();
			boolean isRedirect = action.isRedirect();
			if (isRedirect) {
				// redirect ������� �̵�
				res.sendRedirect(viewPage);
			} else {
				// forward ������� �̵�
				RequestDispatcher disp = req.getRequestDispatcher(viewPage);
				disp.forward(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		} // ������Ʈ�ѷ�(�׼�)�� ������ �޼ҵ带 ȣ���Ѵ�.
	}
}
