package filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
/*
 * 
 * 处理字符乱码过滤器
 * 
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */
public class CharacterEncodingFilter implements Filter {

	private String encoding = null;
	private String originalEncoding = null;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (this.encoding != null && !this.encoding.isEmpty()) {
			request.setCharacterEncoding(this.encoding);
			response.setCharacterEncoding(this.encoding);
			response.setContentType("text/html;charset=" + this.encoding);
		}
		MyHttpServletRequest myReq = new MyHttpServletRequest((HttpServletRequest) request, this.originalEncoding, this.encoding);
		chain.doFilter(myReq, response);

	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		String encoding = config.getInitParameter("encoding");
		String originalEncoding = config.getInitParameter("originalEncoding");
		if (encoding == null || encoding.isEmpty()) {
			encoding = "UTF-8";
		}
		this.encoding = encoding;
		/*
		 * //从Tomcat配置文件server.xml中读取URIEncoding String configPath =
		 * System.getProperty("catalina.home")+ "/conf/server.xml"; XPathFactory
		 * factory = XPathFactory.newInstance(); XPath path =
		 * factory.newXPath(); try {
		 * 
		 * Node node = (Node) path.evaluate(
		 * "//Service[@name='Catalina']/Connector[@protocol='HTTP/1.1']/@URIEncoding"
		 * , new InputSource(new
		 * FileInputStream(configPath)),XPathConstants.NODE); if(node!=null){
		 * originalEncoding=node.getNodeValue(); } } catch
		 * (XPathExpressionException e) { e.printStackTrace(); } catch
		 * (FileNotFoundException e) { e.printStackTrace(); }
		 */
		if (originalEncoding == null || originalEncoding.isEmpty()) {
			originalEncoding = "ISO-8859-1";
		}
		this.originalEncoding = originalEncoding;
	}
}

class MyHttpServletRequest extends HttpServletRequestWrapper {
	private Map<String, String[]> paramMap = null;
	private String originalEncoding;
	private String encoding;

	public MyHttpServletRequest(HttpServletRequest request, String originalEncoding, String encoding) {
		super(request);
		this.originalEncoding = originalEncoding;
		this.encoding = encoding;
	}

	@Override
	public Map<String, String[]> getParameterMap() {

		if (this.paramMap == null) {
			HttpServletRequest request = (HttpServletRequest) this.getRequest();
			Map<String, String[]> paramMap = request.getParameterMap();
			if (!encoding.equals(originalEncoding)) {
				// get请求方式
				if (request.getMethod().equalsIgnoreCase("get")) {
					for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {
						String[] values = entry.getValue();
						for (int i = 0; i < values.length; i++) {
							try {
								values[i] = new String(values[i].getBytes(this.originalEncoding), this.encoding);
							} catch (UnsupportedEncodingException e) {
								e.printStackTrace();
							}
						}
					}
				}
			}
			this.paramMap = paramMap;
		}

		return this.paramMap;

	}

	@Override
	public String getParameter(String name) {
		Map<String, String[]> map = getParameterMap();
		if (map != null) {
			String[] values = map.get(name);
			if (values != null) {
				return values[0];
			}
		}
		return null;
	}

	@Override
	public String[] getParameterValues(String name) {
		Map<String, String[]> map = getParameterMap();
		if (map != null) {
			String[] values = map.get(name);
			if (values != null) {
				return values;
			}
		}
		return null;
	}
}
