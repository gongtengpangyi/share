package com.example.reflect.test;

import java.util.Date;

import org.junit.Test;

import com.example.reflect.ReflectUtil;
import com.example.reflect.model.TestModel;

public class ReflectTest {
	@Test
	public void testSetValue() {
		System.out.println("xxxxxxxxxx");
		TestModel model = new TestModel();
		ReflectUtil.setValue(model, "id", Long.valueOf(1), true);
		ReflectUtil.setValue(model, "name", "sssss", true);
		ReflectUtil.setValue(model, "time", new Date(), true);
		System.out.println(model.toString());
	}
	
	@Test
	public void testSetModelValue() {
		System.out.println("xxxxxxxxxx");
		TestModel model = new TestModel();
		ReflectUtil.setModelValue(model, "id", "1", true);
		ReflectUtil.setModelValue(model, "name", "sssss", true);
		ReflectUtil.setModelValue(model, "time", "2017-03-02 03:03:03", true);
		System.out.println(model.toString());
	}
	
	@Test
	public void testGetValue() {
		TestModel model = new TestModel();
		ReflectUtil.setModelValue(model, "id", "1", true);
		ReflectUtil.setModelValue(model, "name", "sssss", true);
		ReflectUtil.setModelValue(model, "time", "2017-03-02 03:03:03", true);
		System.out.println(ReflectUtil.getValue(model, "time", false));
		System.out.println(ReflectUtil.getValue(model, "id", true));

	}
}
