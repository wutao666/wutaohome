package com.wt.ssm.service;

import java.util.List;

import com.wt.ssm.po.Ticket;

public interface TicketService {
	//查询全部
	public List<List<Ticket>> findAll();
	//购票
	public void buyTicket(int [] ids);
	//清场
	public void clearSeat();
}
