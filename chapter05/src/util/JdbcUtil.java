package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtil {
	
	private static DataSource ds=null;
	private static PreparedStatement pst=null;
	private static ResultSet rs=null;
	private static Connection con = null;
	
	static{
		//1.初始化数据源连接池
		try {
			Context ct = new InitialContext();//初始化JNDI上下文
			ds=(DataSource) ct.lookup("java:comp/env/news");//获取数据源对象compile  environment
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 执行增、删、改SQL
	 * @param sql 需要执行的SQL语句
	 * @param paras 需要传递的SQL参数
	 * @return 受影响的行数
	 */
	public static int updateSQL(String sql,Object ... paras){
		int row=-1;
		try {
			//2.从数据源获取数据库连接
			con = ds.getConnection();
			//3.使用PreparedStatement对象访问数据库
			pst = con.prepareStatement(sql);
			//设置参数
			if (paras!=null) {
				for (int i = 0; i < paras.length; i++) {
					pst.setObject(i+1, paras[i]);
				}
			}
			
			row = pst.executeUpdate();//返回受影响的行数
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//4.释放资源
			closeAll();
		}
		return row;
	}
	/**
	 * 执行查询SQL
	 * @param sql 需要执行的SQL语句
	 * @param paras 需要传递的SQL参数
	 * @return 结果集
	 */
	public static ResultSet querySQL(String sql,Object ... paras) throws SQLException{
		
			//2.从数据源获取数据库连接
			con = ds.getConnection();
			//3.使用PreparedStatement对象访问数据库
			pst = con.prepareStatement(sql);
			//设置参数
			if (paras!=null) {
				for (int i = 0; i < paras.length; i++) {
					pst.setObject(i+1, paras[i]);
				}
			}
			rs=pst.executeQuery();//执行查询并返回结果集
		return rs;
	}
	//4.释放资源
	public static void closeAll() {
		try {
			if (rs!=null && !rs.isClosed()) {
				rs.close();
			}
			if (pst!=null && !pst.isClosed()) {
				pst.close();
			}
			if(con!=null && !con.isClosed()){
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
