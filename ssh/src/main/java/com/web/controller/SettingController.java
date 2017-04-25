package com.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.AccountSet;
import com.web.entity.AccountingSubject;
import com.web.entity.Current;
import com.web.entity.Log;
import com.web.entity.User;
import com.web.entity.VoucherGroup;
import com.web.log.LogController;
import com.web.service.AccountSetService;
import com.web.service.AccountingSubjectService;
import com.web.service.CurrentService;
import com.web.service.LogService;
import com.web.service.UserService;
import com.web.service.VoucherGroupService;

@Controller
@RequestMapping(value="/setting")
public class SettingController {
	
	@Resource
	private UserService userService;
	
	@Resource
	private LogService logService;
	
	@Resource
	private AccountingSubjectService accountingSubjectService;
	
	@Resource
	private VoucherGroupService voucherGroupService;
	
	@Resource
	private CurrentService currentService;
	
	@Resource 
	private AccountSetService accountSetService;
	
	@LogController(modual="设置/账套",content="查看")
	@RequestMapping(value="/accountSet",method=RequestMethod.GET)
	public ModelAndView accountSet(@RequestParam("id")int id){
		User user=userService.get(id);
		List<AccountSet> listAccountSet=accountSetService.getAll();
		ModelAndView mv=new ModelAndView();
		mv.addObject("user", user);
		mv.addObject("listAccountSet", listAccountSet);
		mv.setViewName("setting/accountSet");
		return mv;
	}
	
	@LogController(modual="设置/日志管理",content="日志管理")
	@RequestMapping(value="/toLog",method=RequestMethod.GET)
	public ModelAndView toLog(@RequestParam("id")int id){
		User user=userService.get(id);
		List<Log> listLog=logService.getAll();
		ModelAndView mv=new ModelAndView();
		mv.addObject("id", id);
		mv.addObject("user", user);
		mv.addObject("listLog", listLog);
		mv.setViewName("setting/log");
		return mv;
	}
	
	@LogController(modual="设置/会计科目",content="查询")
	@RequestMapping(value="/accountingSubject",method=RequestMethod.GET)
	public ModelAndView getAccountingSubject(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		List<AccountingSubject> listas=accountingSubjectService.getAll();
		User user=userService.get(id);
		mv.addObject("user",user);
		mv.addObject("listas",listas);
		mv.setViewName("setting/accountingSubject");
		return mv;
	}
	
	@LogController(modual="设置/凭证字",content="查询")
	@RequestMapping(value="/voucherGroup",method=RequestMethod.GET)
	public ModelAndView voucherGroup(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<VoucherGroup> listvg=voucherGroupService.getAll();
		mv.addObject("listvg",listvg);
		mv.addObject("user",user);
		mv.setViewName("setting/voucherGroup");
		return mv;
	}
	
	@LogController(modual="设置/币别",content="查询")
	@RequestMapping(value="/current",method=RequestMethod.GET)
	public ModelAndView current(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<Current> listCurrent=currentService.getAll();
		mv.addObject("listCurrent",listCurrent);
		mv.addObject("user",user);
		mv.setViewName("setting/current");
		return mv;
	}
	
	@LogController(modual="设置/币别",content="to更新")
	@RequestMapping(value="/updateCurrent",method=RequestMethod.GET)
	public ModelAndView toUpdateCurrent(@RequestParam("id")int id,@RequestParam("currentId")int currentId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		Current current=currentService.get(currentId);
		mv.addObject("user", user);
		mv.addObject("current", current);
		mv.setViewName("setting/updateCurrent");
		return mv;
	}
	
	@LogController(modual="设置/币别",content="更新")
	@RequestMapping(value="/updateCurrent",method=RequestMethod.POST)
	public ModelAndView updateCurrent(@RequestParam("id")int id,@RequestParam("currentId")int currentId,
			@RequestParam("name")String name,@RequestParam("code")String code,@RequestParam("rate")float rate
			,@RequestParam("standard")boolean standard){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		Current current=currentService.get(currentId);
		current.setName(name);
		current.setCode(code);
		current.setRate(rate);
		current.setStandard(standard);
		currentService.update(current);
		List<Current> listCurrent=currentService.getAll();
		mv.addObject("listCurrent",listCurrent);
		mv.addObject("user", user);
		mv.setViewName("setting/current");
		return mv;
	}
	
	@LogController(modual="设置/币别",content="to新增")
	@RequestMapping(value="/addCurrent",method=RequestMethod.GET)
	public ModelAndView toAddCurrent(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		int count=currentService.getCount();
		mv.addObject("user", user);
		mv.addObject("count", count);
		mv.setViewName("setting/addCurrent");
		return mv;
	}
	
	@LogController(modual="设置/币别",content="新增")
	@RequestMapping(value="/addCurrent",method=RequestMethod.POST)
	public ModelAndView addCurrent(@RequestParam("id")int id,@RequestParam("currentId")int currentId,
			@RequestParam("name")String name,@RequestParam("code")String code,@RequestParam("rate")float rate
			,@RequestParam("standard")boolean standard){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		Current current=new Current();
		current.setId(currentId);
		current.setName(name);
		current.setCode(code);
		current.setRate(rate);
		current.setStandard(standard);
		currentService.add(current);
		List<Current> listCurrent=currentService.getAll();
		mv.addObject("listCurrent",listCurrent);
		mv.addObject("user", user);
		mv.setViewName("setting/current");
		return mv;
	}
	
	@LogController(modual="设置/期初设置",content="查看")
	@RequestMapping(value="/initialBalance",method=RequestMethod.GET)
	public ModelAndView initialBalance(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<AccountingSubject> listAccountingSubject=accountingSubjectService.getAll();
		mv.addObject("user", user);
		mv.addObject("listAccountingSubject", listAccountingSubject);
		mv.setViewName("setting/initialBalance");
		return mv;
	}
	
	//期初设置-更新期初余额
	@ResponseBody
	@RequestMapping(value="/updateBalance",method=RequestMethod.GET)
	public boolean updateBalance(@RequestParam("asid")int asid,@RequestParam("balance")double balance){
		AccountingSubject as=accountingSubjectService.get(asid);
		as.setBalance(balance);
		return accountingSubjectService.update(as);
	}
	
	//期初设置-试算平衡
	@ResponseBody
	@RequestMapping(value="/calculate",method=RequestMethod.GET)
	public double[] calculate(){
		double d1=accountingSubjectService.calculate(false);
		double d2=accountingSubjectService.calculate(true);
		double result[]=new double[3];
		result[0]=d1;
		result[1]=d2;
		if(d1==d2){
			result[2]=0;
		}else{
			result[2]=1;
		}
		return result;
	}
	//权限控制
	@LogController(modual="设置/权限控制",content="查看")
	@RequestMapping(value="/controlRole",method=RequestMethod.GET)
	public ModelAndView controlRole(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<User> listUser=userService.getAll();
		mv.addObject("user", user);
		mv.addObject("listUser", listUser);
		mv.setViewName("setting/controlRole");
		return mv;
	}
}
