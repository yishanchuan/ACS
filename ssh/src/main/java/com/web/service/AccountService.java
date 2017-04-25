package com.web.service;

import java.util.List;

import com.web.entity.AccountSelect;
import com.web.entity.Voucher;

public interface AccountService {

	public List<AccountSelect> getUsedAccoutingSubject();
	public Voucher getVoucherByVCid(int id);
}
