package com.wt.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wt.ssm.po.Ticket;

public interface TicketMapper {
	//查询全部
	public List<Ticket> findAllTicket();
	//购票
	public void updateTicketById(int seat);
	//清场
	public void updateTicketAll();
	//分组查询
	public List<Ticket> findTicketLimit(@Param("id1")int id1,@Param("id2")int id2);
}
