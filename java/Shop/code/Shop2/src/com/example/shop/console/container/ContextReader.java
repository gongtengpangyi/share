package com.example.shop.console.container;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 * 读取XML然后初始化容器
 * @author FRZ
 *
 */
public class ContextReader {
	private Container container;
	private Element beansElement;
	
	public ContextReader() {
		container = Container.instance();
	}
	
	public Container getContainer() {
		return this.container;
	}
	
	/**
	 * 解析XML将其变为beanMap
	 * @param filePathStr 文件路径
	 */
	@SuppressWarnings("unchecked")
	public void parseXml(String filePathStr){
		/**
		 * 先读取XML，这个没啥好说的
		 */
		SAXReader reader = new SAXReader();
		URI filePath = null;
		try {
			filePath = this.getClass().getResource(filePathStr).toURI();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}
		File file = new File(filePath);
		Document document;
		try {
			document = reader.read(file);
			/**
			 * 到目前为止都是读取XML文件并转换为对应的DOM对象，然后开始解析
			 */
			// 获取根节点，即beans节点
			beansElement = document.getRootElement();
			// 获取bean节点列表
			List<Element> beanElementList = beansElement.elements("bean");
			// 获取import的节点
			addImportBeans(beansElement);
			for (Element beanElement : beanElementList) {
				// 遍历并添加在所有的
				this.addBeanInfo(beanElement);
			}
		} catch(DocumentException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @param beansElement
	 */
	public void addImportBeans(Element beansElement) {
		@SuppressWarnings("unchecked")
		List<Element> importElements = beansElement.elements("import");
		if (importElements == null || importElements.size()<=0) {
			return;
		}
		for (Element importElement : importElements) {
			parseXml(importElement.attributeValue("src"));
		}
	}
	
	/**
	 * 添加bean的信息
	 * @param beanElement XML的DOM节点
	 */
	@SuppressWarnings("unchecked")
	private void addBeanInfo(Element beanElement) {
		String id = beanElement.attributeValue("id");
		if (container.getBeanInfo(id)!=null) {
			// 如果容器中已经存在这个bean的信息，就直接返回
			return;
		}
		// 创建新的bean信息
		BeanInfo bean = new BeanInfo();
		// 设置bean的id
		bean.setId(id);		
		try {			
			// 设置bean的class
			bean.setClazz(Class.forName(beanElement.attributeValue("class")));
			// 获取构造器参数的信息的DOM节点
			List<Element> constructorArgElements = beanElement.elements("constructor-arg");
			if(constructorArgElements!=null && constructorArgElements.size()>0) {
				for (Element constructorArgElement : constructorArgElements) {
					/*
					 * 如果存在则遍历并且将其值添加入Constructor中
					 */
					bean.addConstructorArg(constructorArgElement.element("value").getText());
				}
			}
			// 获取参数节点列表
			List<Element> propertyElements = beanElement.elements("property");
			if(propertyElements!=null && propertyElements.size()>0) {
				for (Element propertyElement : propertyElements) {
					// 如果存在且大于0则遍历并且根据ref获取参数的beanInfo
					String ref = propertyElement.attributeValue("ref");					
					// 添加参数对应的BeanInfo
					bean.addProperty(propertyElement.attributeValue("name"), ref);
				}
			}
			// 添加进入容器的配置map中
			this.container.setBeanInfo(id, bean);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
}
