package com.elephant.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.elephant.dao.ICustomerInfoMapper;
import com.elephant.model.CustomerInfo;
import com.elephant.service.ICustomerInfoService;

@Service
public class CustomerInfoService implements ICustomerInfoService {
	@Autowired
	private ICustomerInfoMapper customerInfoMapper;
	
	public CustomerInfo getCustomerById(long id) {
		CustomerInfo customer = customerInfoMapper.selectByPrimaryKey(id);
		return customer;
	}

	public List<CustomerInfo> selectCustomerList(CustomerInfo customerInfo) {
		return customerInfoMapper.select(customerInfo);
	}

}
