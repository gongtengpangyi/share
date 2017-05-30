package com.example.shop.console.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.example.shop.console.util.DBUtil;

/**
 * 执行基本的数据库增删改查操作的封装
 * 用的是PreparedStatement
 * @author FRZ
 * 基于自开发的DBUtil
 */
public class DataBase {
	private Connection conn;
	private PreparedStatement stmt;
	public DataBase() {
		
	}
	
	/**
	 * 获取数据库连接
	 */
	public void connect() {
		try {
			conn = DBUtil.getConnection();
		} catch (SQLException e) {
			System.out.println("获取数据库连接出错");
			e.printStackTrace();
		}
	}
	
	/**
	 * 关闭数据库
	 */
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("关闭异常");
			e.printStackTrace();
		}
	}

	/**
	 * 执行增删改SQL语句，支持"?"占位符
	 * @param sql SQL语句
	 * @param objs 占位符绑定参数
	 */
	public void excute(String sql, List<Object> objs) {
		this.connect();
		try {
			this.bindSql(sql, objs).execute();
		} catch (SQLException e) {
			System.out.println("执行sql语句出错");
			e.printStackTrace();
		} finally {
			this.close();
		}
	}
	
	/**
	 * 执行增删改SQL语句，支持冒号占位符
	 * @param sql SQL语句
	 * @param params 参数键值对
	 */
	public void excute(String sql, Map<String, Object> params) {
		this.connect();
		try {
			this.bindSqlByParams(sql, params).execute();
		} catch (SQLException e) {
			System.out.println("执行sql语句出错");
			e.printStackTrace();
		} finally {
			this.close();
		}
	}
	
	/**
	 * 执行查询语句，支持"?"形式占位符
	 * @param sql SQL语句
	 * @param objs 绑定的参数
	 * @return 结果集
	 */
	public ResultSet select(String sql, List<Object> objs) {
		this.connect();
		try {
			return this.bindSql(sql, objs).executeQuery();
		} catch (SQLException e) {
			System.out.println("执行sql语句出错");
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 执行查询语句，支持冒号形式占位符
	 * @param sql SQL语句
	 * @param params 绑定的参数键值对
	 * @return 结果集
	 */
	public ResultSet select(String sql, Map<String, Object> params) {
		this.connect();
		try {
			return this.bindSqlByParams(sql, params).executeQuery();
		} catch (SQLException e) {
			System.out.println("执行sql语句出错");
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 根据"?"占位符来绑定参数
	 * @param sql SQL语句
	 * @param objs 绑定参数集合
	 * @return 绑定完的PreparedStatement
	 */
	private PreparedStatement bindSql(String sql, List<Object> objs) {
		try {			
			stmt = conn.prepareStatement(sql);
			for (int i = 0; i<objs.size(); i++ ) {
				// 遍历绑定占位符参数
				stmt.setObject(i + 1, objs.get(i));
			}
		} catch (SQLException e) {
			System.out.println("参数绑定中发生错误");
			e.printStackTrace();
		}
		return stmt;
	}
	
	/**
	 * 绑定冒号形式的具体占位符的SQL语句
	 * @param sql SQL语句
	 * @param params 参数键值对
	 * @return 绑定完的PreparedStatement
	 */
	private PreparedStatement bindSqlByParams(String sql, Map<String, Object> params) {
		List<Object> objs = new ArrayList<Object>();
		// 匹配冒号形式的占位符
		Pattern pat = Pattern.compile(":[a-z|A-Z]*");
		Matcher mat = pat.matcher(sql);
		while (mat.find()) {
			// 遍历占位符将其替换为? ，并且将值压入list中
			String key = mat.group();
			sql = sql.replace(key, "?");
			objs.add(params.get(key.substring(1)));
		}
		return this.bindSql(sql, objs);
	}
	
}
