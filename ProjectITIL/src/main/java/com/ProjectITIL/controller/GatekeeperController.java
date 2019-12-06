package com.ProjectITIL.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ProjectITIL.exception.ResourceNotFoundException;
import com.ProjectITIL.model.Employee;
import com.ProjectITIL.model.Ticket;
import com.ProjectITIL.service.IEmployeeService;

@SessionAttributes("ticket")
@RestController
public class GatekeeperController {

	@Autowired
	public IEmployeeService employeeService;

	@ModelAttribute("ticket")
	public Employee setUpLoginForm() {
		return new Employee();
	}

	private static final Logger LOGGER = LoggerFactory.getLogger(GatekeeperController.class);
	@RequestMapping(value="/viewnew", method=RequestMethod.GET)
	public ModelAndView viewTicketOperation(@ModelAttribute("Ticket") Ticket ticket,Model model) {
		List<Ticket> newTicketList = employeeService.viewNewTickets();
		if(newTicketList==null)
		{
			LOGGER.info("No new Tickets Available");
			ModelAndView view = new ModelAndView("NoNewForm");
			return view;
		}
		else
		{
			ModelAndView view = new ModelAndView("ViewNewForm");
			model.addAttribute("newTicketList", newTicketList);
			return view;
		}
	}
	@RequestMapping("/assign/{id}")
	public ModelAndView showEditProductPage(@PathVariable("id") int ticketId,Model model) throws SQLException {
		System.out.println(ticketId);
		Ticket ticketDetails=employeeService.ticketDetails(ticketId);
		System.out.println(ticketDetails);
		List<Employee> teamMembers= employeeService.teammembers();
		ModelAndView modelAndView = new ModelAndView("Assign");
		model.addAttribute("teamMembers", teamMembers);
		model.addAttribute("ticketDetails", ticketDetails);
		model.addAttribute("ticketId", ticketId);

		return modelAndView;

	}

	@RequestMapping(value = "/assign/teamMembers/{id}")
	public ModelAndView showPreferences(@PathVariable("id") int ticketId,@RequestParam("teamMember") String teamMember,
			Model model) throws Exception {

		int update=employeeService.updateTicket(teamMember, ticketId);
		if(teamMember==null)
		{
			LOGGER.error("No new members assigned");
			throw new ResourceNotFoundException("No new members assigned");
		}
		else
		{
			ModelAndView modelAndView = new ModelAndView("SuccessAssigned");
			return modelAndView;
		}

	}

}