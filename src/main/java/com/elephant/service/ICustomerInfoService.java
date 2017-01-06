package com.elephant.service;

import java.util.List;

import com.elephant.model.CustomerInfo;

public interface ICustomerInfoService {

	CustomerInfo getCustomerById(long id);
	
	List<CustomerInfo> selectCustomerList(CustomerInfo customerInfo);
}
