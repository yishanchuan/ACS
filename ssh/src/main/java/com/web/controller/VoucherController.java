package com.web.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.AccountingSubject;
import com.web.entity.User;
import com.web.entity.Voucher;
import com.web.entity.VoucherCore;
import com.web.entity.VoucherGroup;
import com.web.log.LogController;
import com.web.service.AccountSetService;
import com.web.service.AccountingSubjectService;
import com.web.service.UserService;
import com.web.service.VoucherCoreService;
import com.web.service.VoucherGroupService;
import com.web.service.VoucherService;

@Controller
@RequestMapping(value="/voucher")
public class VoucherController {
	@Resource
	private VoucherService voucherService;
	@Resource
	private UserService userService;
	@Resource
	private VoucherGroupService voucherGroupService;
	@Resource
	private AccountingSubjectService accountingSubjectService;
	@Resource
	private VoucherCoreService voucherCoreService;
	@Resource
	private AccountSetService accountSetService;
	
	//前去增加凭证界面
	@LogController(modual="凭证/to增加凭证",content="to增加凭证")
	@RequestMapping(value="/toAddVoucher", method=RequestMethod.GET)
	public ModelAndView toAddVoucher(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		int vchnum=voucherService.getVchnum();
		List<VoucherGroup> listvg=voucherGroupService.getAll();
		List<AccountingSubject> listas=accountingSubjectService.getAll();
		mv.addObject("user", user);
		mv.addObject("vchnum", vchnum);
		mv.addObject("listvg", listvg);
		mv.addObject("listas", listas);
		mv.setViewName("voucher/addVoucher");
		return mv;
	}
	
	//增加凭证，返回增加凭证界面
	@SuppressWarnings("deprecation")
	@LogController(modual="凭证/增加凭证",content="增加凭证")
	@RequestMapping(value="/addVoucher",method=RequestMethod.POST)
	public ModelAndView addVoucher(@RequestParam("id")int id,
			HttpServletRequest request,@RequestParam("voucherGroup")int vgid,
			@RequestParam("vchnum")int vchnum,@RequestParam("datePicker")String date,
			@RequestParam("total")double total){
		ModelAndView mv=new ModelAndView();
		int rownum=Integer.parseInt(request.getParameter("rownum"));//前台table总行数
		String summary,as;
		int asid;
		double debits,credits;
		DecimalFormat df=new DecimalFormat("########0.00");
		Voucher voucher=new Voucher();
		List<VoucherCore> listvc=new ArrayList<VoucherCore>();
		VoucherCore voucherCore=new VoucherCore();
		User user=userService.get(id);
		voucher.setUser(user);
		voucher.setVouchergroup(voucherGroupService.get(vgid));
		voucher.setVchnum(vchnum);
		df.format(total);
		voucher.setTotal(total);
		//从1900-1-0 00:00:00开始算
		Date dt=new Date(Integer.parseInt(date.substring(0, 4))-1900,
				Integer.parseInt(date.substring(5,7))-1,
				Integer.parseInt(date.substring(8, 10)),
				Integer.parseInt(date.substring(11, 13)),
				Integer.parseInt(date.substring(14, 16)));
		voucher.setDate(dt);
		voucher.setPeriod((new Date().getYear()+1900)*100+new Date().getMonth()+1);
		/*set voucherCore 填充好后放入list，再放入voucher，调用service存入数据库*/
		for(int i=1;i<=rownum;i++){
			summary=request.getParameter("summary"+i);
			if(summary==null){
				continue;
			}
			as=request.getParameter("accountingsubject"+i);
			asid=Integer.parseInt(as.substring(0, 4));
			if(!"".equals(request.getParameter("debits"+i))){
				debits=Double.parseDouble(request.getParameter("debits"+i));
				df.format(debits);
				voucherCore.setDebits(debits);
				voucherCore.setCredits(0.00);
			}else if(!"".equals(request.getParameter("credits"+i))){
				credits=Double.parseDouble(request.getParameter("credits"+i));
				df.format(credits);
				voucherCore.setCredits(credits);
				voucherCore.setDebits(0.00);
			}
			voucherCore.setSummary(summary);
			voucherCore.setAccountingSubject(accountingSubjectService.get(asid));
			listvc.add(voucherCore);
			voucherCore=new VoucherCore();
		}
		voucher.setListvc(listvc);
		voucherService.add(voucher);
		mv.addObject("user",user);//为了使用日志注解,记录用户
		mv.setViewName("redirect:/voucher/toAddVoucher?id="+id);
		return mv;
	}
	
	//查看所有凭证
	@RequestMapping(value="/selectVoucher",method=RequestMethod.GET)
	public ModelAndView selectVoucher(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<Voucher> listv=voucherService.getAll();
		mv.addObject("listv", listv);
		mv.addObject("user", user);
		mv.setViewName("voucher/selectVoucher");
		return mv;
	}
	//审核凭证
	@ResponseBody
	@RequestMapping(value="/checkVoucher",method=RequestMethod.GET)
	public Boolean checkVoucher(@RequestParam("i")int i,@RequestParam("array[]")Integer[] array,@RequestParam("id")int id){
		List<Integer> list=Arrays.asList(array);
		Voucher voucher=null;
		boolean crc=true;
		for(int j=0;j<i;j++){
			voucher=voucherService.get(list.get(j));
			voucher.setChecked(true);
			voucher.setUser(userService.get(id));
			try{
				voucherService.update2(voucher);
			}catch(Exception e){
				crc=false;
			}
		}
		return crc;
	}
	
	//取消审核凭证
	@ResponseBody
	@RequestMapping(value="/uncheckVoucher",method=RequestMethod.GET)
	public Boolean uncheckVoucher(@RequestParam("i")int i,@RequestParam("array[]")Integer[] array,@RequestParam("id")int id){
		List<Integer> list=Arrays.asList(array);
		Voucher voucher=null;
		boolean crc=true;
		for(int j=0;j<i;j++){
			voucher=voucherService.get(list.get(j));
			voucher.setChecked(false);
			voucher.setUser(userService.get(id));
			try{
				voucherService.update2(voucher);
			}catch(Exception e){
				crc=false;
			}
		}
		return crc;
	}
	
	//前往修改账套界面
	@LogController(modual="凭证/to修改凭证",content="to修改凭证")
	@RequestMapping(value="/editVoucher",method=RequestMethod.GET)
	public ModelAndView editVoucher(@RequestParam("id")int id,@RequestParam("voucherid")int voucherid){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<VoucherGroup> listvg=voucherGroupService.getAll();
		List<AccountingSubject> listas=accountingSubjectService.getAll();
		Voucher voucher=voucherService.get(voucherid);
		mv.addObject("user", user);
		mv.addObject("listvg", listvg);
		mv.addObject("listas", listas);
		mv.addObject("voucher", voucher);
		mv.setViewName("voucher/editVoucher");
		return mv;
	}
	
	//修改账套
	@SuppressWarnings("deprecation")
	@LogController(modual="凭证/修改凭证",content="修改凭证")
	@RequestMapping(value="/updateVoucher",method=RequestMethod.POST)
	public ModelAndView updateVoucher(@RequestParam("id")int id,@RequestParam("voucherid")int voucherid,
			HttpServletRequest request,@RequestParam("voucherGroup")int vgid,
			@RequestParam("vchnum")int vchnum,@RequestParam("datePicker")String date,
			@RequestParam("total")double total){
		ModelAndView mv=new ModelAndView();
		int rownum=Integer.parseInt(request.getParameter("rownum"));//前台table总行数
		String summary,as;
		int asid,vcid;
		double debits,credits;
		DecimalFormat df=new DecimalFormat("########0.00");
		//从数据库先获取原来的数据
		Voucher voucher=voucherService.get(voucherid);
		List<VoucherCore> listvc=new ArrayList<VoucherCore>();
		VoucherCore voucherCore=new VoucherCore();
		User user=userService.get(id);
		voucher.setUser(user);
		voucher.setVouchergroup(voucherGroupService.get(vgid));
		voucher.setVchnum(vchnum);
		df.format(total);
		voucher.setTotal(total);
		//从1900-1-0 00:00:00开始算
		Date dt=new Date(Integer.parseInt(date.substring(0, 4))-1900,
				Integer.parseInt(date.substring(5,7))-1,
				Integer.parseInt(date.substring(8, 10)),
				Integer.parseInt(date.substring(11, 13)),
				Integer.parseInt(date.substring(14, 16)));
		voucher.setDate(dt);
		voucher.setPeriod((new Date().getYear()+1900)*100+new Date().getMonth()+1);
		/*set voucherCore 填充好后放入list，再放入voucher，调用service存入数据库*/
		for(int i=1;i<=rownum;i++){
			summary=request.getParameter("summary"+i);
			if(summary==null){
				continue;
			}
			as=request.getParameter("accountingsubject"+i);
			asid=Integer.parseInt(as.substring(0, 4));
			if(!"".equals(request.getParameter("debits"+i))&&Double.parseDouble(request.getParameter("debits"+i))!=0){
				debits=Double.parseDouble(request.getParameter("debits"+i));
				df.format(debits);
				voucherCore.setDebits(debits);
				voucherCore.setCredits(0.00);
			}else if(!"".equals(request.getParameter("credits"+i))&&Double.parseDouble(request.getParameter("credits"+i))!=0){
				credits=Double.parseDouble(request.getParameter("credits"+i));
				df.format(credits);
				voucherCore.setCredits(credits);
				voucherCore.setDebits(0.00);
			}
			voucherCore.setSummary(summary);
			voucherCore.setAccountingSubject(accountingSubjectService.get(asid));
			
			if(!"".equals(request.getParameter("id"+i))){
				//如果Voucher Core有id，则执行更新操作,update2是saveOrUpdate
				vcid=Integer.parseInt(request.getParameter("id"+i));
				voucherCore.setId(vcid);
				voucherCoreService.update(voucherCore);
			}else{
				voucherCoreService.add(voucherCore);
			}
			listvc.add(voucherCore);
			voucherCore=new VoucherCore();
		}
		voucher.setListvc(listvc);
		voucherService.update2(voucher);//这里使用session.update，不好使用hql逐个字段update
		mv.addObject("user",user);//为了使用日志注解,记录用户
		mv.setViewName("redirect:/voucher/selectVoucher?id="+id);
		return mv;
	}
	
	//删除账套
	@RequestMapping(value="/deleteVoucher")
	public ModelAndView deleteVoucher(@RequestParam("id")int id,@RequestParam("voucherid")int voucherid){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		voucherService.delete(voucherid);
		mv.addObject(user);
		mv.setViewName("redirect:/voucher/selectVoucher?id="+id);
		return mv;
	}
}
