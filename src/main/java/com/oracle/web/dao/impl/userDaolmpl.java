package com.oracle.web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.dao.userDao;
import com.oracle.web.utils.DBUtilsPlus;

public class userDaolmpl implements userDao {

	@Override
	public List<Book> showUser() {
		Connection conn = null;

		PreparedStatement ps = null;

		ResultSet rs = null;

		List<Book> list = new ArrayList<Book>();
		try {
			conn = DBUtilsPlus.getConnection();

			ps = conn.prepareStatement("select * from book");

			rs = ps.executeQuery();

			while (rs.next()) {// 这些都是从数据库里查出来的！！

				Book f = new Book();
				int id = rs.getInt(1);
				f.setId(id);
				System.out.println(id);
				String name = rs.getString(2);
				f.setName(name);
				String price = rs.getString(3);
				f.setPrice(price);

				String chubanshe = rs.getString(4);
				f.setChubanshe(chubanshe);
				String zhuangtai = rs.getString(5);
				f.setZhuangtai(zhuangtai);
				String username = rs.getString(6);
				f.setUsername(username);
				int kucun = rs.getInt(7);
				f.setKucun(kucun);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			DBUtilsPlus.close(conn, ps, rs);

		}
		return list;
	}

	@Override
	public List<Book> showUserByIds(String[] arr) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Book> list = new ArrayList<Book>();
		try {
			conn = DBUtilsPlus.getConnection();

			/*
			 * 
			 * 动态生成SQL
			 */

			String sql = dongtaiSQL(arr);// 创建一个类用来调sql；；

			ps = conn.prepareStatement(sql);

			// 有几个问号，我们需要设置几个ps.setXXX()

			// {1} {2,3}

			for (int i = 0; i < arr.length; i++) {

				ps.setInt(1 + i, Integer.parseInt(arr[i]));
			}
			rs = ps.executeQuery();
			while (rs.next()) {
				Book s = new Book();
				int id = rs.getInt(1);
				s.setId(id);
				System.out.println(id);
				String name = rs.getString(2);
				s.setName(name);
				String price = rs.getString(3);
				s.setPrice(price);

				String chubanshe = rs.getString(4);
				s.setChubanshe(chubanshe);
				String zhuangtai = rs.getString(5);
				s.setZhuangtai(zhuangtai);
				String username = rs.getString(6);
				s.setUsername(username);
				int kucun = rs.getInt(7);
				s.setKucun(kucun);

				list.add(s);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtilsPlus.close(conn, ps, rs);
		}

		return list;
	}

	private String dongtaiSQL(String[] arr) {
		// TODO Auto-generated method stub
		StringBuilder sBuilder = new StringBuilder("select * from book where id in (");

		for (int i = 0; i < arr.length; i++) {

			sBuilder.append("?");

			if (i < arr.length - 1) {

				sBuilder.append(",");
			}
		}

		sBuilder.append(")");

		return sBuilder.toString();
	}

}
