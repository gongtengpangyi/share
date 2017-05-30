package com.example.servlet;

import java.util.Date;

import cn.hdu.wlw.console.biz.MessageBiz;
import cn.hdu.wlw.console.util.ToolSpring;
import cn.hdu.wlw.model.Message;


public class RecvMessage {
	public static int TEST_MESSAGE = 0;					//测试信号标识
	public static int RES_MESSAGE = 1;					//返回信号标识
	public static int SEND_MESSAGE = 2;					//发送信号标识
	
	private Integer fromUserId;
	private Integer toUserId;
	private String context;								//文本信息内容
	private String type;
	private Date date;
	private Message message;
	private MessageBiz messageBiz;
	public RecvMessage() {
		super();
		messageBiz = (MessageBiz) ToolSpring.getBean("messageBiz");
	}
	
	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Integer getFromUserId() {
		return fromUserId;
	}

	public void parse(String line) {
		/*
		 * 信息内容三种：
		 * fromUserId:Test,-1,xxx
		 * fromUserId:Result,-1,messageId
		 * fromUserId:Send,toUserId,message
		 */
		System.out.println(line);
		date = new Date();
		int i = line.indexOf(":");
		fromUserId = Integer.valueOf(line.substring(0, i));
		line = line.substring(i + 1);
		i = line.indexOf(",");
		type = line.substring(0,i);
		line = line.substring(i + 1);
		i = line.indexOf(",");
		toUserId = Integer.valueOf(line.substring(0,i));
		context = line.substring(i + 1);
		message = new Message(context, fromUserId, toUserId ,date);
	}

	public int messgaeType() {
		if(type.equals("Test")) {
			return TEST_MESSAGE;
		}else if(type.equals("Send")) {
			messageBiz.save(message);
			return SEND_MESSAGE;
		}else if(type.equals("Result")) {
			return RES_MESSAGE;
		}
		return -1;	
	}
	
}
