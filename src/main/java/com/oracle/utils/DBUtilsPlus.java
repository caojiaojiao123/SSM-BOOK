package com.oracle.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.mysql.jdbc.Driver;

public class DBUtilsPlus {

	private static String driver=null;
	
	private static String url=null;
	private static String user=null;
	private static String password=null;
	
	static{
		//1.
		Properties p=new Properties();
		InputStream in=null;
		//2.
		try {
			// in =new FileInputStream("jdbc.properties");
			
		in=DBUtilsPlus.class.getClassLoader().getResourceAsStream("jdbcl.properties");
		//3.
		p.load(in);
		driver=p.getProperty("driver");
		
		url=p.getProperty("url");
		
		user=p.getProperty("user");
		
		password=p.getProperty("password");
		
		Class.forName(driver);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	public static Connection getConnection() throws SQLException {

		return DriverManager.getConnection(url, user, password);

	}

	// 2.�ͷ���ɾ�ĵ���Դ

	public static void close(Connection conn, Statement stmt) {

		CloseStmt(stmt);
		CloseConn(conn);
	}

	private static void CloseConn(Connection conn) {
		// TODO Auto-generated method stub
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	private static void CloseStmt(Statement stmt) {
		// TODO Auto-generated method stub
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 3.�ͷŲ�ѯ����Դ

	public static void close(Connection conn, Statement stmt, ResultSet rs) {

		CloseRs(rs);
		CloseConn(conn);
		CloseStmt(stmt);

	}

	private static void CloseRs(ResultSet rs) {
		// TODO Auto-generated method stub
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
