package com.oracle.munguFactory.ljw.service;

import java.util.List;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.dto.OrdersDetailDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.StoragesDTO;
import com.oracle.munguFactory.dto.SubulDTO;

public interface ljwService {

	List<SubulDTO> getSubulList(PageDTO paging);

	int getSubulListSize(PageDTO searchOptions);

	List<FactoryDTO> getFactoryList();

	List<AccountsDTO> getAccountList();

	List<OrdersDTO> getOrderList(int account_no);

	List<OrdersDetailDTO> getOrdersDetailList(int suju_no);

	int insertShipment(SubulDTO subul) throws Exception;

	OrdersDetailDTO getOrdersDetail(int suju_no, int item_no);

	List<StoragesDTO> getStoragesInfo(int factory_no);

}
