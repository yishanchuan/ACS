package com.web.util;

import java.io.UnsupportedEncodingException;

import org.apache.commons.codec.binary.Base64;

public class Base64Util {
	
	//base64加密
	public static String encode(String cookieStr){
		try{
			cookieStr=new String(Base64.encodeBase64(cookieStr.getBytes("UTF-8")));
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		return cookieStr;
	}
	//base64解密
	public static String decode(String cookieStr){
		try{
			cookieStr=new String(Base64.decodeBase64(cookieStr.getBytes("UTF-8")));
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		return cookieStr;
	}
	
	public static void main(String[] args){
		String name="用户1";
		name=Base64Util.encode(name);
		System.out.println(name);
		name=Base64Util.decode(name);
		System.out.println(name);
	}
}
