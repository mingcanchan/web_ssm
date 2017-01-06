package com.ming.service;

import java.util.List;

import com.ming.model.CustomerInfo;

public interface ICustomerInfoService {

	CustomerInfo getCustomerById(long id);
	
	List<CustomerInfo> selectCustomerList(CustomerInfo customerInfo);
}
