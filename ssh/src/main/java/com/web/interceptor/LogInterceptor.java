package com.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.User;

public class LogInterceptor implements HandlerInterceptor{

	/*
	 * 释放资源
	 * */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	/*
	 * 方法调用后，视图渲染前
	 * */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView mv)
			throws Exception {
		if(mv!=null){
			//mv.getModel()不能为null，会抛nullPointerException
		if(mv.getModel().containsKey("user")){
			User user=(User) mv.getModel().get("user");
			String[] modual=mv.getViewName().split("/");
			System.out.println(modual[0]+","+modual[1]);
			int num=user.getRole().getLevel();
			if(modual[0].equals("setting")){
				if(num>3){
					//有权限
					if(num==4&&modual[1].equals("power")){
						//level4不可进行权限分配
						mv.addObject("exception", "需要level5权限访问该模块，当前用户权限为"+num);
						mv.setViewName("error/exception");
					}
				}else{
					//level4以下不可进行setting
					mv.addObject("exception", "需要level4权限访问该模块，当前用户权限为"+num);
					mv.setViewName("error/exception");
				}
			}else if(modual[0].equals("voucher")){
				if(num<3){
					//level3以下不可管理凭证
					mv.addObject("exception", "需要level3权限访问该模块，当前用户权限为"+num);
					mv.setViewName("error/exception");
				}
			}else if(modual[0].equals("cashier")){
				if(num<2){
					mv.addObject("exception", "需要level2权限访问该模块，当前用户权限为"+num);
					mv.setViewName("error/exception");
				}
			}
		}
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		
		return true;
	}

}
