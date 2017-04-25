package com.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.AccountSelect;
import com.web.entity.AccountingSubject;
import com.web.entity.Subsidiary;
import com.web.entity.User;
import com.web.entity.Voucher;
import com.web.entity.VoucherCore;
import com.web.log.LogController;
import com.web.service.AccountService;
import com.web.service.AccountingSubjectService;
import com.web.service.UserService;
import com.web.service.VoucherCoreService;
import com.web.service.VoucherService;

@Controller
@RequestMapping(value="/account")
public class AccountController {

	@Resource
	private UserService userService;
	
	@Resource
	private AccountService accountService;
	
	@Resource 
	private AccountingSubjectService accountingSubjectService;
	
	@Resource
	private VoucherCoreService voucherCoreService;
	
	@Resource
	private VoucherService voucherService;
	
	@LogController(content = "明细账",modual="账簿")
	@RequestMapping(value="/subsidiary",method=RequestMethod.GET)
	public ModelAndView subsidiary(@RequestParam("id")int id) throws ParseException{
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<AccountSelect> list=accountService.getUsedAccoutingSubject();
		AccountingSubject as=accountingSubjectService.get(list.get(0).getId());
		List<VoucherCore> listvc=voucherCoreService.getMul(as);
		List<Subsidiary> listSub=new ArrayList<Subsidiary>();
		//第一个明细是期初余额
		Voucher voucher=accountService.getVoucherByVCid(listvc.get(0).getId());
		Subsidiary subsidiary=new Subsidiary();
		subsidiary.setDate(voucher.getDate());
		subsidiary.setSubject(list.get(0).toString());
		subsidiary.setSummary("期初余额");
		subsidiary.setBalance(as.getBalance());
		listSub.add(subsidiary);
		//遍历voucher core
		double balance=as.getBalance(),debits=0,credits=0;
		for(VoucherCore vc:listvc){
			subsidiary=new Subsidiary();
			voucher=accountService.getVoucherByVCid(vc.getId());
			subsidiary.setDate(voucher.getDate());
			subsidiary.setVch(voucher.getVouchergroup().getName()+"-"+voucher.getVchnum());
			subsidiary.setSubject(as.getId()+as.getName());
			subsidiary.setSummary(vc.getSummary());
			subsidiary.setDebit(vc.getDebits());
			subsidiary.setCredit(vc.getCredits());
			debits+=vc.getDebits();
			credits+=vc.getCredits();
			if(vc.getCredits()==0){
				//借
				subsidiary.setDc(false);
				if(as.isDc()){
					balance +=vc.getDebits();
					subsidiary.setBalance(balance);
				}else{
					balance -=vc.getDebits();
					subsidiary.setBalance(balance);
				}
			}else{
				//贷
				subsidiary.setDc(true);
				if(as.isDc()){
					balance -=vc.getCredits();
					subsidiary.setBalance(balance);
				}else{
					balance +=vc.getCredits();
					subsidiary.setBalance(balance);
				}
			}
			listSub.add(subsidiary);
		}
		subsidiary=new Subsidiary();
		subsidiary.setDate(voucher.getDate());
		subsidiary.setSummary("本年合计");
		subsidiary.setDebit(debits);
		subsidiary.setCredit(credits);
		subsidiary.setBalance(balance);
		listSub.add(subsidiary);
		mv.addObject("as", as);
		mv.addObject("list", list);
		mv.addObject("user", user);
		mv.addObject("listvc", listvc);
		mv.addObject("listSub", listSub);
		mv.setViewName("account/subsidiary");
		return mv;
	}
	
	@LogController(content = "查看明细账", modual = "账簿")
	@RequestMapping(value="/selectSubsidiary",method=RequestMethod.GET)
	public ModelAndView selectSubsidiary(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		
		return mv;
	}
}
