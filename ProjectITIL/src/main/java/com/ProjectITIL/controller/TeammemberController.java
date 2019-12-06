package com.ProjectITIL.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ProjectITIL.exception.ResourceNotFoundException;
import com.ProjectITIL.model.Employee;
import com.ProjectITIL.model.Ticket;
import com.ProjectITIL.service.IEmployeeService;

@SessionAttributes("employee")
@RestController
public class TeammemberController {

	private static final Logger LOGGER = LoggerFactory.getLogger(TeammemberController.class);
	@Autowired
	public IEmployeeService employeeService;

	@ModelAttribute("employee")
	public Employee setUpLoginForm() {
		return new Employee();
	}

	@RequestMapping(value="/viewassigned", method=RequestMethod.GET)
	public ModelAndView viewTicketOperation(@SessionAttribute("employee") Employee employee,Model model) {
		List<Ticket> assignedTicketList = employeeService.viewAssignedTickets(employee.getEmployeeName());
		if(assignedTicketList==null)
		{
			LOGGER.info("No Tickets Assigned");
			ModelAndView view = new ModelAndView("NoTicketsAssigned");
			return view;
		}
		else
		{
			ModelAndView view = new ModelAndView("ViewAssignedForm");
			model.addAttribute("newTicketList", assignedTicketList);
			return view;
		}
	}
	@RequestMapping("/complete/{id}")
	public ModelAndView showEditProductPage(@PathVariable("id") int ticketId,Model model) {

		ModelAndView modelAndView = new ModelAndView("Complete");
		HashMap<String,String> ticketType =new HashMap<String,String>();
		ticketType.put("Pending","Pending");
		ticketType.put("Completed","Completed");
		Ticket ticketDetails=employeeService.ticketDetails(ticketId);
		model.addAttribute("ticketDetails", ticketDetails);
		model.addAttribute("ticketType", ticketType);
		model.addAttribute("ticketId", ticketId);

		return modelAndView;

	}

	@RequestMapping(value = "/complete/ticketType/{id}")
	public ModelAndView showPreferences(@PathVariable("id") int ticketId,@RequestParam("ticketType") String ticketType,
			Model model) throws Exception {
		if(ticketType==null)
		{
			LOGGER.error("No ticketType selected");
			throw new ResourceNotFoundException("No ticketType selected");
		}
		else
		{
			int update=employeeService.updateTicketStatus(ticketType, ticketId);
			ModelAndView modelAndView = new ModelAndView("SuccessCompleted");
			return modelAndView;
		}

	}
}
