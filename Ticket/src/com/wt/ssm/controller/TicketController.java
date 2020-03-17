package com.wt.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wt.ssm.po.Ticket;
import com.wt.ssm.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	@Autowired
	private TicketService ticketService;

	@RequestMapping("tosell")
	public String tosell(Model model) {
		List<List<Ticket>> list = this.ticketService.findAll();
		model.addAttribute("LIST", list);
		return "sell";
	}
	
	@RequestMapping("buyTicket")
	public String buyTicket(int [] ids) {	
		this.ticketService.buyTicket(ids);
		return "redirect:tosell.do";
	}
	
	@RequestMapping("clearSeat")
	public String clearSeat() {
		this.ticketService.clearSeat();
		return "redirect:tosell.do";
	}
}
