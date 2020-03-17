package com.wt.ssm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wt.ssm.mapper.TicketMapper;
import com.wt.ssm.po.Ticket;
import com.wt.ssm.service.TicketService;
@Service
public class TicketServiceImpl implements TicketService {
	@Autowired
	private TicketMapper ticketMapper;
	//分组查询
	@Override
	public List<List<Ticket>> findAll() {
/*
        List<List<Ticket>> list = new ArrayList<List<Ticket>>();  -->大数组列表
		List<Ticket> list1 = this.ticketMapper.findTicketLimit(0, 5);  -->分组后的小数组列表
		list.add(list1);  -->把小数组添加到大数组中
*/
		List<List<Ticket>> list = new ArrayList<List<Ticket>>();
		for (int i = 0,j=0; i < 5; i++) {
			list.add(this.ticketMapper.findTicketLimit(j, 5));
			j = j + 5;
		}
		return list;
	}
	//买票
	@Override
	public void buyTicket(int[] ids) {
		for (int i : ids) {
			this.ticketMapper.updateTicketById(i);
		}
	}
	//清场
	@Override
	public void clearSeat() {
		this.ticketMapper.updateTicketAll();
	}

}
