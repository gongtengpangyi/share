package com.example.shop.console.util;

import java.sql.SQLException;

import javax.sql.DataSource;
import java.sql.Connection;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 数据库C3P0线程池基本工具，用于获取连接等操作
 * @author FRZ
 * 依赖于C3P0和JDBC
 */
public class DBUtil {
	// 饿汉式  
    private static DataSource ds = new ComboPooledDataSource();  
      
    /** 
     * 它为null表示没有事务 
     * 它不为null表示有事务 
     * 当开启事务时，需要给它赋值 
     * 当结束事务时，需要给它赋值为null 
     * 并且在开启事务时，让dao的多个方法共享这个Connection 
     */  
    private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();  
      
    public static DataSource getDataSource() {  
        return ds;  
    }  
    
    /** 
     * dao使用本方法来获取连接 
     * @return 
     * @throws SQLException 
     */  
    public static Connection getConnection() throws SQLException {  
        /* 
         * 如果有事务，返回当前事务的con 
         * 如果没有事务，通过连接池返回新的con 
         */  
        Connection con = tl.get();//获取当前线程的事务连接  
        if(con != null) return con;  
        return (Connection) ds.getConnection();  
    }    
	
}
