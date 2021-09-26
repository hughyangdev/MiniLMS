package common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter("/*")
public class EncodingFilter implements Filter {

	public void destroy() {
	}
	//���� ó���� ���� ó���� ���� ������ doFilter()�޼ҵ� �ȿ��� �����Ѵ�.
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		//post����� ���� �ѱ� ó���� ���⼭ ������ ó���ϵ��� ����.
		//System.out.println("EncodingFilter doFilter()ȣ���...");
		req.setCharacterEncoding("UTF-8");
		chain.doFilter(req, res);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
