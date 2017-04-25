package com.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.AccountingSubject;
import com.web.entity.Bank;
import com.web.entity.BankJournal;
import com.web.entity.Cash;
import com.web.entity.Current;
import com.web.entity.IEType;
import com.web.entity.Journal;
import com.web.entity.User;
import com.web.log.LogController;
import com.web.service.AccountSetService;
import com.web.service.AccountingSubjectService;
import com.web.service.BankJournalService;
import com.web.service.BankService;
import com.web.service.CashService;
import com.web.service.CurrentService;
import com.web.service.IETypeService;
import com.web.service.JournalService;
import com.web.service.UserService;

@Controller
@RequestMapping(value="/cashier")
public class CashierController {
//出纳管理
	@Resource
	private UserService userService;
	
	@Resource
	private CashService cashService;
	
	@Resource
	private CurrentService currentService;
	
	@Resource
	private AccountingSubjectService accountingSubjectService;
	
	@Resource
	private BankService bankService;
	
	@Resource
	private IETypeService iETypeService;
	
	@Resource
	private JournalService journalService;
	
	@Resource
	private BankJournalService bankJournalService;
	
	@Resource
	private AccountSetService accountSetService;
	
	private static Logger log=Logger.getLogger(CashierController.class);
	
	//现金日记账
	@LogController(modual="出纳/现金日记账",content="增加")
	@RequestMapping(value="/cashJournal",method=RequestMethod.GET)
	public ModelAndView cashJournal(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<Cash> listCash=cashService.getAll();
		Cash cash=listCash.get(0);//默认选择第一个
		List<Journal> listJournal=journalService.getAll();
		List<IEType> listIEType=iETypeService.getAll();
		int count=journalService.getCount();
		mv.addObject("user",user);
		mv.addObject("listCash", listCash);
		mv.addObject("cash", cash);
		mv.addObject("listJournal", listJournal);
		mv.addObject("listIEType", listIEType);
		mv.addObject("count", count);
		mv.setViewName("cashier/cashJournal");
		return mv;
	}
	
	//现金日记账初始化
	@ResponseBody
	@RequestMapping(value="/updateInitial",method=RequestMethod.GET)
	public boolean updateInitial(@RequestParam("balance")double balance,@RequestParam("cashid")int cashid){
		Cash cash=cashService.get(cashid);
		cash.setBalance(balance);
		boolean a=true;
		if(!cashService.update(cash)){
			log.error("初始化现金余额失败");
			a=false;
		}
		return a;
	}
	
	//现金日记账保存每条记录
	@ResponseBody
	@RequestMapping(value="/saveJournal",method=RequestMethod.GET)
	public int saveJournal(@RequestParam("id")int id,
			@RequestParam("date")String dateString,
			@RequestParam("description")String description,
			@RequestParam("ietypeId")int ietypeId,
			@RequestParam("income")double income,
			@RequestParam("expenditure")double expenditure,
			@RequestParam("cashId")int cashId){
		Journal journal=new Journal();
		journal.setId(id);
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date=new Date();
			date = sdf.parse(dateString);
			journal.setDate(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		journal.setDescription(description);
		journal.setIetype(iETypeService.get(ietypeId));
		journal.setIncome(income);
		journal.setExpenditure(expenditure);
		journal.setCash(cashService.get(cashId));
		if(journalService.get(id)!=null){
			journalService.update(journal);
		}else{
			journalService.add(journal);
		}
		return journalService.getCount();
	}
	//计算当前日期下有多少条记录
	@ResponseBody
	@RequestMapping(value="/getCountByDate",method=RequestMethod.GET)
	public int getCountByDate(@RequestParam("date")String datestring) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=sdf.parse(datestring);
		return journalService.getCountByDate(date);
	}
	//搜索现金日记账
	@LogController(modual="出纳/现金日记账",content="搜索")
	@RequestMapping(value="/searchJournal",method=RequestMethod.POST)
	public ModelAndView searchJournal(@RequestParam("id")int id,@RequestParam("cash")int cashid,@RequestParam("daterange")String daterange){
		ModelAndView mv=new ModelAndView();
		Cash cash=cashService.get(cashid);
		User user=userService.get(id);
		String dates1=daterange.substring(0, 10),dates2=daterange.substring(13, 23);
		Date date1=new Date(),date2=new Date();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
			date1 = sdf.parse(dates1);
			date2=sdf.parse(dates2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<Journal> listJournal=journalService.search(cashService.get(cashid), date1, date2);
		List<Cash> listCash=cashService.getAll();
		List<IEType> listIEType=iETypeService.getAll();
		int count=journalService.getCount();
		mv.addObject("cash", cash);
		mv.addObject("user",user);
		mv.addObject("listCash", listCash);
		mv.addObject("listJournal", listJournal);
		mv.addObject("listIEType", listIEType);
		mv.addObject("count", count);
		mv.setViewName("cashier/cashJournal");
		return mv;
	}
	
	//ajax删除journal
	@ResponseBody
	@RequestMapping(value="/deleteJournal",method=RequestMethod.GET)
	public boolean deleteJournal(@RequestParam("journalId")int id){
		return journalService.delete(id);
	}
	
	//银行日记账
	@LogController(modual="出纳/银行日记账",content="增加")
	@RequestMapping(value="/bankJournal",method=RequestMethod.GET)
	public ModelAndView bankJournal(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<Bank> listBank=bankService.getAll();
		Bank bank=new Bank();
		if(!listBank.isEmpty()){
			bank=listBank.get(0);//默认选择第一个
		}
		List<BankJournal> listBankJournal=bankJournalService.getAll();
		List<IEType> listIEType=iETypeService.getAll();
		int count=bankJournalService.getCount();
		mv.addObject("user",user);
		mv.addObject("listBank", listBank);
		mv.addObject("bank", bank);
		mv.addObject("listBankJournal", listBankJournal);
		mv.addObject("listIEType", listIEType);
		mv.addObject("count", count);
		mv.setViewName("cashier/bankJournal");
		return mv;
	}
	
	//现金日记账初始化
	@ResponseBody
	@RequestMapping(value="/updateBankInitial",method=RequestMethod.GET)
	public boolean updateBankInitial(@RequestParam("balance")double balance,
			@RequestParam("bankId")int bankId){
		Bank bank=bankService.get(bankId);
		bank.setBalance(balance);
		boolean a=true;
		if(!bankService.update(bank)){
			log.error("初始化现金余额失败");
			a=false;
		}
		return a;
	}
	
	//现金日记账保存每条记录
	@ResponseBody
	@RequestMapping(value="/saveBankJournal",method=RequestMethod.GET)
	public int saveBankJournal(@RequestParam("id")int id,
			@RequestParam("date")String dateString,
			@RequestParam("description")String description,
			@RequestParam("ietypeId")int ietypeId,
			@RequestParam("income")double income,
			@RequestParam("expenditure")double expenditure,
			@RequestParam("bankId")int bankId){
		BankJournal bankJournal=new BankJournal();
		bankJournal.setId(id);
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date=new Date();
			date = sdf.parse(dateString);
			bankJournal.setDate(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bankJournal.setDescription(description);
		bankJournal.setIetype(iETypeService.get(ietypeId));
		bankJournal.setIncome(income);
		bankJournal.setExpenditure(expenditure);
		bankJournal.setBank(bankService.get(bankId));
		if(bankJournalService.get(id)!=null){
			bankJournalService.update(bankJournal);
		}else{
			bankJournalService.add(bankJournal);
		}
		return bankJournalService.getCount();
	}
	//计算当前日期下有多少条记录
	@ResponseBody
	@RequestMapping(value="/getBankCountByDate",method=RequestMethod.GET)
	public int getBankCountByDate(@RequestParam("date")String datestring) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=sdf.parse(datestring);
		return journalService.getCountByDate(date);
	}
	//搜索现金日记账
	@LogController(modual="出纳/现金日记账",content="搜索")
	@RequestMapping(value="/searchBankJournal",method=RequestMethod.POST)
	public ModelAndView searchBankJournal(@RequestParam("id")int id,@RequestParam("bank")int bankId,@RequestParam("daterange")String daterange){
		ModelAndView mv=new ModelAndView();
		Bank bank=bankService.get(bankId);
		User user=userService.get(id);
		String dates1=daterange.substring(0, 10),dates2=daterange.substring(13, 23);
		Date date1=new Date(),date2=new Date();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
			date1 = sdf.parse(dates1);
			date2=sdf.parse(dates2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<BankJournal> listBankJournal=bankJournalService.search(bankService.get(bankId), date1, date2);
		List<Bank> listBank=bankService.getAll();
		List<IEType> listIEType=iETypeService.getAll();
		int count=bankJournalService.getCount();
		mv.addObject("bank", bank);
		mv.addObject("user",user);
		mv.addObject("listBank", listBank);
		mv.addObject("listBankJournal", listBankJournal);
		mv.addObject("listIEType", listIEType);
		mv.addObject("count", count);
		mv.setViewName("cashier/bankJournal");
		return mv;
	}
	
	//AJAX删除journal
	@ResponseBody
	@RequestMapping(value="/deleteBankJournal",method=RequestMethod.GET)
	public boolean deleteBankJournal(@RequestParam("bankJournalId")int id){
		return bankJournalService.delete(id);
	}
	
	@LogController(modual="出纳/资金报表",content="查看")
	@RequestMapping(value="/report",method=RequestMethod.GET)
	public ModelAndView report(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<Journal> listJournal = null;
		List<BankJournal> listBankJournal = null;
		List<Cash> listCash = cashService.getAll();
		List<Bank> listBank = bankService.getAll();
		List<IEType> listIEType=iETypeService.getAll();
		double journalIncomeAll=0,journalExpenAll=0,
				bankJournalIncomeAll=0,bankJournalExpenAll=0;
		int journalIncomeCount=0,journalExpenCount=0,
				bankJournalIncomeCount=0,bankJournalExpenCount=0;
		//按账户汇总
		double[][] cashStat=new double[listCash.size()][3];
		double[][] bankStat=new double[listBank.size()][3];
		int[][] cashIENum=new int[listCash.size()][2];
		int[][] bankIENum=new int[listBank.size()][2];
		//按收支类别汇总
		double[][] ietypeStat=new double[listIEType.size()][2];
		int[][] ietypeNum=new int[listIEType.size()][2];
		double incomeAll=0,expenAll=0;
		int incomeCount=0,expenCount=0;
		//数组每一维存放一个cash统计信息，依次是期初余额、收入总额、支出总额、收入笔数、支出笔数
		//bank也一样
		//下面依次遍历求出统计信息
		for(int i = 0;i<listCash.size();i++){
			//遍历listCash找到每个cash的所有journal
			listJournal=journalService.getAllByCash(listCash.get(i));
			for(int j = 0;j<listJournal.size();j++){
				if(listJournal.get(j).getIetype().isIe()){
					//true收，false支
					journalIncomeAll+=listJournal.get(j).getIncome();
					journalIncomeCount++;
				}else{
					journalExpenAll+=listJournal.get(j).getExpenditure();
					journalExpenCount++;
				}
			}
			cashStat[i][0]=journalIncomeAll;
			cashStat[i][1]=journalExpenAll;
			cashStat[i][2]=listCash.get(i).getBalance()+journalIncomeAll-journalExpenAll;
			cashIENum[i][0]=journalIncomeCount;
			cashIENum[i][1]=journalExpenCount;
			journalIncomeAll=journalExpenAll=journalIncomeCount=journalExpenCount=0;
		}
		for(int i = 0;i<listBank.size();i++){
			//遍历listBank找到每个Bank的所有BankJournal
			listBankJournal=bankJournalService.getAllByBank(listBank.get(i));
			for(int j = 0;j<listBankJournal.size();j++){
				if(listBankJournal.get(j).getIetype().isIe()){
					//true收，false支
					bankJournalIncomeAll+=listBankJournal.get(j).getIncome();
					bankJournalIncomeCount++;
				}else{
					bankJournalExpenAll+=listBankJournal.get(j).getExpenditure();
					bankJournalExpenCount++;
				}
			}
			bankStat[i][0]=bankJournalIncomeAll;
			bankStat[i][1]=bankJournalExpenAll;
			bankStat[i][2]=listBank.get(i).getBalance()+bankJournalIncomeAll-bankJournalExpenAll;
			bankIENum[i][0]=bankJournalIncomeCount;
			bankIENum[i][1]=bankJournalExpenCount;
			bankJournalIncomeAll=bankJournalExpenAll=bankJournalIncomeCount=bankJournalExpenCount=0;
		}
		listJournal=journalService.getAll();
		listBankJournal=bankJournalService.getAll();
		for(int i=0;i<listIEType.size();i++){
			for(int j=0;j<listJournal.size();j++){
				if(listJournal.get(j).getIetype().getId()==listIEType.get(i).getId()){
					if(listJournal.get(j).getIetype().isIe()){
						incomeAll+=listJournal.get(j).getIncome();
						incomeCount++;
					}else{
						expenAll+=listJournal.get(j).getExpenditure();
						expenCount++;
					}
				}
			}
			for(int j=0;j<listBankJournal.size();j++){
				if(listIEType.get(i).getId()==listBankJournal.get(j).getIetype().getId()){
					if(listBankJournal.get(j).getIetype().isIe()){
						incomeAll+=listBankJournal.get(j).getIncome();
						incomeCount++;
					}else{
						expenAll+=listJournal.get(j).getExpenditure();
						expenCount++;
					}
				}
			}
			ietypeStat[i][0]=incomeAll;
			ietypeStat[i][1]=expenAll;
			ietypeNum[i][0]=incomeCount;
			ietypeNum[i][1]=expenCount;
			incomeAll=expenAll=incomeCount=expenCount=0;
		}
		mv.addObject("user", user);
		mv.addObject("listCash", listCash);
		mv.addObject("listBank", listBank);
		mv.addObject("listIEType", listIEType);
		mv.addObject("cashStat", cashStat);
		mv.addObject("cashIENum", cashIENum);
		mv.addObject("bankStat", bankStat);
		mv.addObject("bankIENum", bankIENum);
		mv.addObject("ietypeStat", ietypeStat);
		mv.addObject("ietypeNum", ietypeNum);
		mv.setViewName("cashier/report");
		return mv;
	}
		
	@LogController(modual="出纳/资金报表",content="查看")
	@RequestMapping(value="/searchReportByDate",method=RequestMethod.POST)
	public ModelAndView searchReportByDate(@RequestParam("id")int id,@RequestParam("daterange")String daterange){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		String dates1=daterange.substring(0, 10),dates2=daterange.substring(13, 23);
		Date date1=new Date(),date2=new Date();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
			date1 = sdf.parse(dates1);
			date2=sdf.parse(dates2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<Journal> listJournal = null;
		List<BankJournal> listBankJournal = null;
		List<Cash> listCash = cashService.getAll();
		List<Bank> listBank = bankService.getAll();
		List<IEType> listIEType=iETypeService.getAll();
		double journalIncomeAll=0,journalExpenAll=0,
				bankJournalIncomeAll=0,bankJournalExpenAll=0;
		int journalIncomeCount=0,journalExpenCount=0,
				bankJournalIncomeCount=0,bankJournalExpenCount=0;
		//按账户汇总
		double[][] cashStat=new double[listCash.size()][3];
		double[][] bankStat=new double[listBank.size()][3];
		int[][] cashIENum=new int[listCash.size()][2];
		int[][] bankIENum=new int[listBank.size()][2];
		//按收支类别汇总
		double[][] ietypeStat=new double[listIEType.size()][2];
		int[][] ietypeNum=new int[listIEType.size()][2];
		double incomeAll=0,expenAll=0;
		int incomeCount=0,expenCount=0;
		//数组每一维存放一个cash统计信息，依次是期初余额、收入总额、支出总额、收入笔数、支出笔数
		//bank也一样
		//下面依次遍历求出统计信息
		for(int i = 0;i<listCash.size();i++){
			//遍历listCash找到每个cash的所有journal
			//listJournal=journalService.getAllByCash(listCash.get(i));
			listJournal=journalService.search(listCash.get(i), date1, date2);
			for(int j = 0;j<listJournal.size();j++){
				if(listJournal.get(j).getIetype().isIe()){
					//true收，false支
					journalIncomeAll+=listJournal.get(j).getIncome();
					journalIncomeCount++;
				}else{
					journalExpenAll+=listJournal.get(j).getExpenditure();
					journalExpenCount++;
				}
			}
			cashStat[i][0]=journalIncomeAll;
			cashStat[i][1]=journalExpenAll;
			cashStat[i][2]=listCash.get(i).getBalance()+journalIncomeAll-journalExpenAll;
			cashIENum[i][0]=journalIncomeCount;
			cashIENum[i][1]=journalExpenCount;
			journalIncomeAll=journalExpenAll=journalIncomeCount=journalExpenCount=0;
		}
		for(int i = 0;i<listBank.size();i++){
			//遍历listBank找到每个Bank的所有BankJournal
			//listBankJournal=bankJournalService.getAllByBank(listBank.get(i));
			listBankJournal=bankJournalService.search(listBank.get(i), date1, date2);
			for(int j = 0;j<listBankJournal.size();j++){
				if(listBankJournal.get(j).getIetype().isIe()){
					//true收，false支
					bankJournalIncomeAll+=listBankJournal.get(j).getIncome();
					bankJournalIncomeCount++;
				}else{
					bankJournalExpenAll+=listBankJournal.get(j).getExpenditure();
					bankJournalExpenCount++;
				}
			}
			bankStat[i][0]=bankJournalIncomeAll;
			bankStat[i][1]=bankJournalExpenAll;
			bankStat[i][2]=listBank.get(i).getBalance()+bankJournalIncomeAll-bankJournalExpenAll;
			bankIENum[i][0]=bankJournalIncomeCount;
			bankIENum[i][1]=bankJournalExpenCount;
			bankJournalIncomeAll=bankJournalExpenAll=bankJournalIncomeCount=bankJournalExpenCount=0;
		}
		listJournal=journalService.searchNoCash(date1, date2);
		listBankJournal=bankJournalService.searchNoBank(date1, date2);
		for(int i=0;i<listIEType.size();i++){
			for(int j=0;j<listJournal.size();j++){
				if(listJournal.get(j).getIetype().getId()==listIEType.get(i).getId()){
					if(listJournal.get(j).getIetype().isIe()){
						incomeAll+=listJournal.get(j).getIncome();
						incomeCount++;
					}else{
						expenAll+=listJournal.get(j).getExpenditure();
						expenCount++;
					}
				}
			}
			for(int j=0;j<listBankJournal.size();j++){
				if(listIEType.get(i).getId()==listBankJournal.get(j).getIetype().getId()){
					if(listBankJournal.get(j).getIetype().isIe()){
						incomeAll+=listBankJournal.get(j).getIncome();
						incomeCount++;
					}else{
						expenAll+=listJournal.get(j).getExpenditure();
						expenCount++;
					}
				}
			}
			ietypeStat[i][0]=incomeAll;
			ietypeStat[i][1]=expenAll;
			ietypeNum[i][0]=incomeCount;
			ietypeNum[i][1]=expenCount;
			System.out.println("-------------"+incomeAll+","+expenAll+","+incomeCount+","+expenCount);
			incomeAll=expenAll=incomeCount=expenCount=0;
		}
		mv.addObject("user", user);
		mv.addObject("listCash", listCash);
		mv.addObject("listBank", listBank);
		mv.addObject("listIEType", listIEType);
		mv.addObject("cashStat", cashStat);
		mv.addObject("cashIENum", cashIENum);
		mv.addObject("bankStat", bankStat);
		mv.addObject("bankIENum", bankIENum);
		mv.addObject("ietypeStat", ietypeStat);
		mv.addObject("ietypeNum", ietypeNum);
		mv.setViewName("cashier/report");
		return mv;
	}
	//收支类别-start
	//查看收支类别
	@LogController(modual="出纳/收支类别",content="查看")
	@RequestMapping(value="/IEType",method=RequestMethod.GET)
	public ModelAndView IEType(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<IEType> listIEType=iETypeService.getAll();
		mv.addObject("user", user);
		mv.addObject("listIEType", listIEType);
		mv.setViewName("cashier/IEType");
		return mv;
	}
	//前往更新收支类别页面-GET
	@LogController(modual="出纳/收支类别",content="to更新")
	@RequestMapping(value="/updateIEType",method=RequestMethod.GET)
	public ModelAndView toUpdateIEType(@RequestParam("id")int id,@RequestParam("iETypeId")int iETypeId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		IEType iEType=iETypeService.get(iETypeId);
		mv.addObject("user",user);
		mv.addObject("iEType",iEType);
		mv.setViewName("cashier/handleIEType");
		return mv;
	}
	//更新收支类别-POST
	@LogController(modual="出纳/收支类别",content="更新")
	@RequestMapping(value="/updateIEType",method=RequestMethod.POST)
	public ModelAndView updateIEType(@RequestParam("id")int id,@RequestParam("iETypeId")int iETypeId,
			@RequestParam("name")String name,@RequestParam("ie")boolean ie){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		IEType iEType=iETypeService.get(iETypeId);
		iEType.setName(name);
		iEType.setIe(ie);
		iETypeService.update(iEType);
		mv.addObject("user",user);
		mv.setViewName("redirect:/cashier/IEType?id="+user.getId());
		return mv;
	}
	@LogController(modual="出纳/收支类别",content="删除")
	@RequestMapping(value="/deleteIEType",method=RequestMethod.GET)
	public ModelAndView deleteIEType(@RequestParam("id")int id,@RequestParam("iETypeId")int iETypeId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		iETypeService.delete(iETypeId);
		mv.addObject("user",user);
		mv.setViewName("redirect:/cashier/IEType?id="+user.getId());
		return mv;
	}
	@LogController(modual="出纳/收支类别",content="to增加")
	@RequestMapping(value="/addIEType",method=RequestMethod.GET)
	public ModelAndView toAddIEType(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		int count=cashService.getCount();
		mv.addObject("user",user);
		mv.addObject("count", count);
		mv.setViewName("cashier/handleIEType");
		return mv;
	}
	@LogController(modual="出纳/收支类别",content="增加")
	@RequestMapping(value="/addIEType",method=RequestMethod.POST)
	public ModelAndView addIEType(@RequestParam("id")int id,@RequestParam("iETypeId")int iETypeId,
			@RequestParam("name")String name,@RequestParam("ie")boolean ie){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		IEType iEType=new IEType();
		iEType.setId(iETypeId);
		iEType.setName(name);
		iEType.setIe(ie);
		iETypeService.add(iEType);
		mv.addObject("user",user);
		mv.setViewName("redirect:/cashier/IEType?id="+user.getId());
		return mv;
	}
	
	//账户设置
	@LogController(modual="出纳/账户设置",content="查看")
	@RequestMapping(value="/accountSetting",method=RequestMethod.GET)
	public ModelAndView accountSetting(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<Cash> listCash=cashService.getAll();
		List<Bank> listBank=bankService.getAll();
		mv.addObject("user",user);
		mv.addObject("listCash",listCash);
		mv.addObject("listBank", listBank);
		mv.setViewName("cashier/accountSetting");
		return mv;
	}
	@LogController(modual="出纳/账户设置",content="to更新现金")
	@RequestMapping(value="/updateCash",method=RequestMethod.GET)
	public ModelAndView toUpdateCash(@RequestParam("id")int id,@RequestParam("cashId")int cashId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		Cash cash=cashService.get(cashId);
		List<Current> listCurrent=currentService.getAll();
		List<AccountingSubject> listas=accountingSubjectService.getAll();
		mv.addObject("user",user);
		mv.addObject("cash",cash);
		mv.addObject("listCurrent", listCurrent);
		mv.addObject("listas", listas);
		mv.setViewName("cashier/updateCash");
		return mv;
	}
	@LogController(modual="出纳/账户设置",content="更新现金")
	@RequestMapping(value="/updateCash",method=RequestMethod.POST)
	public ModelAndView updateCash(@RequestParam("id")int id,@RequestParam("cashId")int cashId,
			@RequestParam("name")String name,@RequestParam("currentId")int currentId,
			@RequestParam("accountingSubjectId")int accountingSubjectId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		Cash cash=cashService.get(cashId);
		cash.setName(name);
		Current current=currentService.get(currentId);
		AccountingSubject accountingSubject=accountingSubjectService.get(accountingSubjectId);
		cash.setCurrent(current);
		cash.setAccountingSubject(accountingSubject);
		cashService.update(cash);
		mv.addObject("user",user);
		mv.setViewName("redirect:/cashier/accountSetting?id="+user.getId());
		return mv;
	}
	@LogController(modual="出纳/账户设置",content="删除现金")
	@RequestMapping(value="/deleteCash",method=RequestMethod.GET)
	public ModelAndView deleteCash(@RequestParam("id")int id,@RequestParam("cashId")int cashId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		cashService.delete(cashId);
		mv.addObject("user",user);
		mv.setViewName("redirect:/cashier/accountSetting?id="+user.getId());
		return mv;
	}
	@LogController(modual="出纳/账户设置",content="to增加现金")
	@RequestMapping(value="/addCash",method=RequestMethod.GET)
	public ModelAndView toAddCash(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<Current> listCurrent=currentService.getAll();
		List<AccountingSubject> listas=accountingSubjectService.getAll();
		int count=cashService.getCount();
		mv.addObject("user",user);
		mv.addObject("listCurrent", listCurrent);
		mv.addObject("listas", listas);
		mv.addObject("count", count);
		mv.setViewName("cashier/addCash");
		return mv;
	}
	@LogController(modual="出纳/账户设置",content="增加现金")
	@RequestMapping(value="/addCash",method=RequestMethod.POST)
	public ModelAndView addCash(@RequestParam("id")int id,@RequestParam("cashId")int cashId,
			@RequestParam("name")String name,@RequestParam("currentId")int currentId,
			@RequestParam("accountingSubjectId")int accountingSubjectId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		Cash cash=new Cash();
		cash.setId(cashId);
		cash.setName(name);
		Current current=currentService.get(currentId);
		AccountingSubject accountingSubject=accountingSubjectService.get(accountingSubjectId);
		cash.setCurrent(current);
		cash.setAccountingSubject(accountingSubject);
		cashService.add(cash);
		mv.addObject("user",user);
		mv.setViewName("redirect:/cashier/accountSetting?id="+user.getId());
		return mv;
	}
	
	//账户管理-银行账户
	@LogController(modual="出纳/账户设置",content="to更新银行")
	@RequestMapping(value="/updateBank",method=RequestMethod.GET)
	public ModelAndView toUpdateBank(@RequestParam("id")int id,@RequestParam("bankId")int bankId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		Bank bank=bankService.get(bankId);
		List<Current> listCurrent=currentService.getAll();
		List<AccountingSubject> listas=accountingSubjectService.getAll();
		mv.addObject("user",user);
		mv.addObject("bank",bank);
		mv.addObject("listCurrent", listCurrent);
		mv.addObject("listas", listas);
		mv.setViewName("cashier/updateBank");
		return mv;
	}
	@LogController(modual="出纳/账户设置",content="更新银行")
	@RequestMapping(value="/updateBank",method=RequestMethod.POST)
	public ModelAndView updateBank(@RequestParam("id")int id,@RequestParam("bankId")int bankId,
			@RequestParam("name")String name,@RequestParam("bankAccount")String bankAccount,@RequestParam("currentId")int currentId,
			@RequestParam("accountingSubjectId")int accountingSubjectId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		Bank bank=bankService.get(bankId);
		bank.setName(name);
		bank.setBankAccount(bankAccount);
		Current current=currentService.get(currentId);
		AccountingSubject accountingSubject=accountingSubjectService.get(accountingSubjectId);
		bank.setCurrent(current);
		bank.setAccountingSubject(accountingSubject);
		bankService.update(bank);
		mv.addObject("user",user);
		mv.setViewName("redirect:/cashier/accountSetting?id="+user.getId());
		return mv;
	}
	@LogController(modual="出纳/账户设置",content="删除银行")
	@RequestMapping(value="/deleteBank",method=RequestMethod.GET)
	public ModelAndView deleteBank(@RequestParam("id")int id,@RequestParam("bankId")int bankId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		bankService.delete(bankId);
		mv.addObject("user",user);
		mv.setViewName("redirect:/cashier/accountSetting?id="+user.getId());
		return mv;
	}
	@LogController(modual="出纳/账户设置",content="to增加银行")
	@RequestMapping(value="/addBank",method=RequestMethod.GET)
	public ModelAndView toAddBank(@RequestParam("id")int id){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		List<Current> listCurrent=currentService.getAll();
		List<AccountingSubject> listas=accountingSubjectService.getAll();
		int count=bankService.getCount();
		mv.addObject("user",user);
		mv.addObject("listCurrent", listCurrent);
		mv.addObject("listas", listas);
		mv.addObject("count", count);
		mv.setViewName("cashier/addBank");
		return mv;
	}
	@LogController(modual="出纳/账户设置",content="增加银行")
	@RequestMapping(value="/addBank",method=RequestMethod.POST)
	public ModelAndView addBank(@RequestParam("id")int id,@RequestParam("bankId")int bankId,
			@RequestParam("name")String name,@RequestParam("bankAccount")String bankAccount,@RequestParam("currentId")int currentId,
			@RequestParam("accountingSubjectId")int accountingSubjectId){
		ModelAndView mv=new ModelAndView();
		User user=userService.get(id);
		Bank bank=new Bank();
		bank.setId(bankId);
		bank.setName(name);
		bank.setBankAccount(bankAccount);
		Current current=currentService.get(currentId);
		AccountingSubject accountingSubject=accountingSubjectService.get(accountingSubjectId);
		bank.setCurrent(current);
		bank.setAccountingSubject(accountingSubject);
		bankService.add(bank);
		mv.addObject("user",user);
		mv.setViewName("redirect:/cashier/accountSetting?id="+user.getId());
		return mv;
	}
}
