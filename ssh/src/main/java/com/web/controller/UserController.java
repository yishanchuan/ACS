package com.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.User;
import com.web.log.LogController;
import com.web.service.UserService;
import com.web.util.Base64Util;

@Controller
@RequestMapping(value="/user")//用户模块旗下
public class UserController {
	@Resource(name="userService")
	private UserService userService;
	
	@LogController(modual="基础模块/首页",content="用户登录")
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam("userName") String userName,@RequestParam("password") String password,@RequestParam(value="remenberme",required=false)String rememberme,HttpServletRequest request,HttpServletResponse response){
		User user=userService.getByName(userName);
		ModelAndView mv=new ModelAndView();
		if(user!=null){
			if(user.getPassword().equals(password)){
				Cookie nameCookie=new Cookie("name",Base64Util.encode(user.getUserName()));
				Cookie pwdCookie=new Cookie("pwd",Base64Util.encode(user.getPassword()));
				nameCookie.setPath(request.getContextPath());
				pwdCookie.setPath(request.getContextPath());
				//rememberme{checked:on,unchecked:null}
				if(rememberme=="on"||rememberme!=null){
					//cookie默认保存七天
					nameCookie.setMaxAge(7*24*60*60);
					pwdCookie.setMaxAge(7*24*60*60);
				}else{
					nameCookie.setMaxAge(0);
					pwdCookie.setMaxAge(0);
				}
				response.addCookie(nameCookie);
				response.addCookie(pwdCookie);
				mv.setViewName("user/main");
				mv.addObject("user", user);
				mv.addObject("id", user.getId());
			}else{
				mv.setViewName("user/login");
				mv.addObject("error", userName+"密码不正确");
			}
		}else{
			mv.setViewName("user/login");
			mv.addObject("error", "没有用户名为"+userName);
		}
		return mv;
	}
	
	@LogController(modual="基础模块/首页",content="用户注册")
	@RequestMapping(value="/register", method={RequestMethod.POST})
	public ModelAndView register(@RequestParam("userName") String userName,
			@RequestParam("password") String password,
			@RequestParam("email") String email){
		ModelAndView mv=new ModelAndView();
		boolean hasError =false;
		//用户名、邮箱唯一性检查
		if(userService.getByName(userName)!=null){
			hasError=true;
			mv.setViewName("user/register");
			mv.addObject("uerror", userName+"用户名已经被取");
		}
		if(userService.getByName(email)!=null){
			hasError=true;
			mv.setViewName("user/register");
			mv.addObject("eerror","邮箱已经被注册");
		}
		//注册
		if(!hasError){
			User user=new User();
			user.setUserName(userName);
			user.setPassword(password);
			user.setEmail(email);
			userService.add(user);
			mv.setViewName("user/main");
			mv.addObject("user", userService.getByName(userName));
			mv.addObject("id", userService.getByName(userName).getId());
		}
		return mv;
	}
	
	@RequestMapping(value="/toRegister",method={RequestMethod.GET})
	public String toRegister(){
		return "user/register";
	}
	
	@RequestMapping(value="/toLogin")
	public String toLogin(){
		return "user/login";
	}
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public ModelAndView main(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		mv.addObject(user);
		mv.setViewName("user/main");
		return mv;
	}
}
