package com.ming.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ming.model.ChartsData;
import com.ming.model.CustomerInfo;
import com.ming.model.HighchartsModel;
import com.ming.service.ICustomerInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/customer")
public class CustomerInfoController {


	@Autowired
	private ICustomerInfoService customerService;
	
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public String getCustomer(HttpServletRequest request,ModelMap modelMap,@PathVariable("id")long id){
		CustomerInfo customerInfo = customerService.getCustomerById(id);
		modelMap.addAttribute("customerInfo", customerInfo);
		return "customerInfo";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	@ResponseBody
	public String selectCustomerList(HttpServletRequest request,CustomerInfo customerInfo){
		//ModelAndView mav = new ModelAndView();
		PageHelper.startPage(1, 10);
		PageHelper.orderBy("insert_time desc");
		List<CustomerInfo> customerList = customerService.selectCustomerList(customerInfo);
		PageInfo<CustomerInfo> pagehelper = new PageInfo<CustomerInfo>(customerList);
		//mav.addObject("customerList", pagehelper);
		return JSON.toJSONString(pagehelper);
	}
	@RequestMapping(value="/getHighcharts",method=RequestMethod.GET)
	@ResponseBody
	public HighchartsModel getHighcharts(){
		HighchartsModel highchartsModel = new HighchartsModel();
		highchartsModel.setTitle("市场比例");
		highchartsModel.setText("中国三大影视业市场调查");
		List<String> categories = new ArrayList<String>();
		categories.add("万达");
		categories.add("中影");
		categories.add("金逸");
		highchartsModel.setCategories(categories);
		List<ChartsData> list = new ArrayList<ChartsData>();
		ChartsData chartsData = new ChartsData();
		int[] data = new int[]{5,7,9};
		chartsData.setData(data);
		chartsData.setName("市场占有率");
		chartsData.setColor("#00FF00");
		chartsData.setDashStyle("longdash");
	
		list.add(chartsData);
		ChartsData chartsData1 = new ChartsData();
		int[] data1 = new int[]{4,4,2};
		chartsData1.setData(data1);
		chartsData1.setName("收入百分比");
		chartsData1.setColor("#FF00FF");
		chartsData1.setDashStyle("shortdot");
		list.add(chartsData1);
		highchartsModel.setSeries(list);
		return highchartsModel;
	}


}
