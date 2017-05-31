package com.example.shop.console.dao;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.example.shop.console.util.ModelUtil;
import com.example.shop.model.Entity;

public class DaoImpl<T extends Entity> implements Dao<T> {
	/*
	 * 数据库连接类的对象，所有数据库操作的执行者
	 */
	private DataBase db;
	
	/*
	 * 泛型类的Class，用于反射机制的实现
	 */
	private Class<?> clazz;

	/**
	 * DAO的构造函数，完成了两个内部重要参数的初始化
	 * @param clazz 用于泛型类Class对象的初始化
	 */
	public DaoImpl(Class<?> clazz) {
		super();
		db = new DataBase();
		this.clazz = clazz;
	}

	/**
	 * 泛型类对象的初始化
	 * @return 泛型类的对象
	 */
	@SuppressWarnings("unchecked")
	private T newInstance() {
		try {
			/*
			 * 利用反射机制去获取泛型类的对象
			 */
			return (T) clazz.newInstance();
		} catch (InstantiationException | IllegalAccessException e) {
			System.out.println("初始化出错");
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void save(T model) {
		/*
		 * 存储的实现，整个过程是带占位符参数的SQL语句的拼接以及参数键值对的填充
		 */
		
		// 获取类的注解，即数据表信息
		DBTable dbTable = clazz.getAnnotation(DBTable.class);	
		// 初始化SQL语句，将insert的表名称完整化
		String sql = "insert into " + dbTable.name() + "(";		
		// 将values后缀语句初始化
		String sqlValue = "values (";
		// 初始化用于查询id的SQL语句
		String sqlFind = "from " + clazz.getName() + " o where ";
		// 初始化参数键值对
		Map<String, Object> params = new HashMap<String, Object>();		
		// 获取泛型类的所有参数
		Field[] fields = clazz.getDeclaredFields();		
		for (Field field : fields) {
			/*
			 * 遍历所有参数
			 */
			// 获取参数的注解，即数据表字段的具体信息
			DBField dbField = field.getAnnotation(DBField.class);	
			if (dbField == null) {	
				/*
				 * 如果数据表字段不存在就直接进入下一循环（理论上规范化的开发不应该出现这种情况）
				 */
				continue;	
			}
			// 将字段的名字拼接在SQL语句中 
			sql = sql + dbField.name() + ",";	
			// 将字段对应变量的名字以占位符形式绑定在values语句中
			sqlValue = sqlValue + ":" + field.getName() + ",";		
			// 用所有传入存储的参数去查询ID
			sqlFind = sqlFind + "o." + field.getName() + "=:" +field.getName() + " and ";
			// 将占位符参数键值对填充到map中
			params.put(field.getName(), getFieldValue(model, field, dbField.foreignKey()));	
		}
		/*
		 * 最后拼接完整的SQL语句并用DataBase对象去执行
		 */
		sql = sql.substring(0, sql.length() - 1) + ") " + sqlValue.substring(0, sqlValue.length() - 1) + ");";
		sqlFind = sqlFind.substring(0, sqlFind.length()-5) + " order by o." + dbTable.keyName() + " desc;";
		System.out.println(sql);
		db.excute(sql, params);
		model.setId(this.query(sqlFind, params).get(0).getId());
	}

	@Override
	public void delete(T model) {
		/*
		 * 删除的实现
		 */
		
		// 获取类注解
		DBTable dbTable = clazz.getAnnotation(DBTable.class);
		// 拼接字符串，由于删除是以主键为关键字查询的，而这个项目中主键在类变量中我们是定死的id变量，
		// 唯一变化的是主键在数据库中的名字（傻逼设计）
		String sql = "delete from " + dbTable.name() + " where " + dbTable.keyName() + "=:primaryKeyID";
		// 参数键值对
		Map<String, Object> params = new HashMap<String, Object>();
		// 填充id参数并且执行
		params.put("primaryKeyID", model.getId());
		db.excute(sql, params);
	}

	@Override
	public void update(T model) {
		/*
		 * 更新的实现
		 * 和存储的过程和类似，稍微注释几句
		 */
		
		// 获取类注解
		DBTable dbTable = clazz.getAnnotation(DBTable.class);
		// 初始化SQL语句
		String sql = "update " + dbTable.name() + " set ";
		// 初始化键值对
		Map<String, Object> params = new HashMap<String, Object>();
		Field[] fields = clazz.getDeclaredFields();
		for (Field field : fields) {
			DBField dbField = field.getAnnotation(DBField.class);
			if (dbField == null) {
				continue;
			}
			// SQL拼接
			// TODO: 其实这里还可以加一句抛出异常来增加可维护性，这个可以放到后面来说
			sql = sql + dbField.name() + "=:" + field.getName() + ",";
			params.put(field.getName(), getFieldValue(model, field, dbField.foreignKey()));
		}
		/*
		 * 最后的拼接和执行，这里算是把update的where部分和save的参数绑定部分合在一起
		 * 为了防止id和参数冲突，因此特意将id变为大写，因为参数键值对中的参数名对应的是类变量名字
		 * 按照标准的非静态变量驼峰命名，不会出现ID这种情况，因此这么设计，
		 * 但是如果想要加强架构的可维护性，可以在前面的变量循环中抛出自定义异常
		 */
		sql = sql.substring(0, sql.length() - 1) + " where " + dbTable.keyName() + "=:primaryKeyID";
		params.put("primaryKeyID", model.getId());
		System.out.println(sql);
		db.excute(sql, params);
	}

	@Override
	public void excute(String sql, Map<String, Object> params) {
		/*
		 * 把SQL语句执行一下
		 */
		sql = sql.replace(clazz.getName(), clazz.getAnnotation(DBTable.class).name());
		db.excute(sql, params);
	}

	@Override
	public List<T> query(String sql, Map<String, Object> params) {
		/*
		 * 执行查询语句的操作，这个既是提供给内部的find操作的基本公共函数，
		 * 也是提供给上一层次控制器执行自定义查询操作的重要接口
		 */
		
		// 先把SQL语句中的类名给替换了，这里之所以这么做，
		// 是因为在实际的开发过程中类名是可知而表名是不可知的
		sql = sql.replace(clazz.getName(), clazz.getAnnotation(DBTable.class).name());
		// 正则匹配o.xxx形式的字段，因为凡是这个形式的字段都需要被拿来替换成真实的字段名字
		Pattern pat = Pattern.compile("o\\.[a-z|A-Z|.]*");
		Matcher mat = pat.matcher(sql);
		while (mat.find()) {
			/*
			 * 遍历正则匹配的所有成功结果
			 */
			try {
				if(mat.group().matches("o\\.[a-z|A-Z]*\\.")) {
					// 如果是o.xxx.yyy形式，说明变量本身就是一个model类对象
					// （不过目前还没有实现，不支持）
					sql = getObjectSql(sql, mat.group());
					continue;
				} else if (mat.group().equals("o.id")) {
					// 如果是id，因为是在父类中定义所以直接执行
					sql = sql.replace(mat.group(), "o." + clazz.getAnnotation(DBTable.class).keyName());
					continue;
				}
				// 如果前两者都不是就根据名字去查询变量
				Field field = clazz.getDeclaredField(mat.group().substring(2));
				if (field == null) {
					continue;
				}
				// 将匹配结果替换为数据库字段名字，仍旧是o.xxx形式
				sql = sql.replace(mat.group(), "o." + field.getAnnotation(DBField.class).name());
			} catch (NoSuchFieldException | SecurityException e) {
				continue;
			}

		}
		System.out.println(sql);
		/*
		 * 前面匹配替换了具体的where语句的参数，之后就是正式查询并处理结果了
		 */
		// 执行查询语句
		ResultSet rs = db.select("select * " + sql, params);
		// 初始化结果集合
		List<T> list = new ArrayList<T>();
		try {
			while (rs.next()) {
				/*
				 * 遍历所有的结果
				 */
				// 初始化泛型类对象
				T model = this.newInstance();
				// 填充对象的主键id
				model.setId(rs.getInt(clazz.getAnnotation(DBTable.class).keyName()));
				// 获取类的所有字段
				Field[] fields = clazz.getDeclaredFields();
				for (Field field : fields) {
					/*
					 * 遍历
					 */
					// 获取字段注解
					DBField dbField = field.getAnnotation(DBField.class);
					// 获得字段的查询结果
					String value = rs.getString(dbField.name());
					if (!isForeignKeyAble(dbField.foreignKey())) {
						// 如果不是外键，即不是以model类对象（虽然目前还不支持）为变量，则将其set进model对象中
						ModelUtil.setValue(model, field.getName(), value);
					} else {
						// 如果是的，那。。。现在还没实现
						setForeignValue(model, field, value);
					}
				}
				// 添加进集合中
				list.add(model);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("SQL语句查询失败");
			e.printStackTrace();
			return null;
		} finally {
			db.close();
		}
	}

	@Override
	public List<T> findAll() {
		return this.query("from " + clazz.getName(), null);
	}

	@Override
	public T findById(Integer id) {
		String sql = "from " + clazz.getName() + " o where o.id=:id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		List<T> list = this.query(sql, params);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	/**
	 * 获取字段的值
	 * @param model 对象
	 * @param field 字段
	 * @param foreignKey 外键匹配字符串
	 * @return 值
	 */
	private Object getFieldValue(T model, Field field, String foreignKey) {
		if (!isForeignKeyAble(foreignKey)) {
			return ModelUtil.getValue(model, field.getName());
		} else {
			return getForeignFieldValue(model, field, foreignKey);
		}
	}
	
	/**
	 * 获取外键字段的值
	 * @param model 对象
	 * @param field 字段
	 * @param foreignKey 外键匹配字符串
	 * @return 值
	 */
	private Object getForeignFieldValue(T model, Field field, String foreignKey) {
		// TODO:
		return null;
	}
	
	/**
	 * 对于以对象参数形式的SQL条件语句的兼容
	 * @param sql SQL语句
	 * @param str 对象形式的值
	 * @return 兼容完成后的SQL
	 */
	public String getObjectSql(String sql, String str) {
		//TODO:
		str = str.substring(2);
//		String object = str.substring(0, str.indexOf("."));
		
		return sql;
	}
	
	/**
	 * 
	 * @param model
	 * @param field
	 * @param value
	 */
	private void setForeignValue(T model, Field field, Object value) {
		//TODO:
	}

	/**
	 * 判断该外键是否合法
	 * @param foreignKey 外键注解字符串
	 * @return 是否为合法外键字符串
	 */
	private boolean isForeignKeyAble(String foreignKey) {
		String expr = "[a-z|A-Z]*.[a-z|A-Z]*";
		return foreignKey != null && !foreignKey.equals("") && foreignKey.matches(expr);
	}

}
