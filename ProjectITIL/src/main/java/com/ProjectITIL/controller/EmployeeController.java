package com.ProjectITIL.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
public class EmployeeController {

	@Autowired
	public IEmployeeService employeeService;

	private static final Logger LOGGER = LoggerFactory.getLogger(EmployeeController.class);

	@ModelAttribute("employee")
	public Employee setUpLoginForm() {
		return new Employee();
	}

	@RequestMapping("/first")
	public ModelAndView welcome() {
		LOGGER.info("Application Started");
		ModelAndView modelAndView=new ModelAndView("Welcome");
		return modelAndView;
	}


	@RequestMapping("/login")
	public ModelAndView login() {
		LOGGER.info("New User try to login");
		ModelAndView modelAndView=new ModelAndView("Login");
		return modelAndView;
	}


	@GetMapping(value="/loginForm")
	public ModelAndView loginOperation(@ModelAttribute("employee") Employee employee1) {
		LOGGER.info("User  " + employee1.getEmployeeName() + " Logging in");
		Employee employee2= employeeService.findRole(employee1);
		if(employee2==null)
		{
			LOGGER.error("No such Employee Exists");
			throw new ResourceNotFoundException("No such Employee Exist");
		}
		else
		{
			String employeeRole=employee2.getEmployeeRole();
			ModelAndView modelAndView1=null;
			if(employeeRole.equals("Employee"))
			{
				modelAndView1=new ModelAndView("/Employee");
				return modelAndView1;
			}

			else if(employeeRole.equals("Gatekeeper"))

			{
				modelAndView1=new ModelAndView("/Gatekeeper");
				return modelAndView1;
			}


			else if(employeeRole.equals("Team member"))
			{
				modelAndView1=new ModelAndView("/Teammember");
				return modelAndView1;	
			}

			else 
				return null;
		}

	}


	@RequestMapping(value="/view", method=RequestMethod.GET)
	public ModelAndView viewTicketOperation(@SessionAttribute("employee") Employee employee,Model model) {
		Employee employee2=employeeService.findByEmployeeName(employee.getEmployeeName());

		List<Ticket> ticketList = employeeService.myTickets(employee2.getEmployeeId());
		if (ticketList==null)
		{
			LOGGER.error("No Tickets raised by employeeId");
			throw new ResourceNotFoundException("No tickets raised by"+employee.getEmployeeId());
		}
		else{
			ModelAndView view = new ModelAndView("ViewTicketForm");
			model.addAttribute("ticketList", ticketList);
			return view;
		}
	}
	/*@RequestMapping("/view")
	public ModelAndView viewTickets() {
		ModelAndView modelAndView=new ModelAndView("ViewTickets");
		return modelAndView;
	}*/

	/*	@RequestMapping(value="/ViewTickets", method=RequestMethod.GET)
	public ModelAndView viewTicketOperation(@ModelAttribute("Ticket") Ticket ticket,Model model) {
		List<Ticket> ticketList = employeeService.myTickets(ticket.getEmployeeId());
System.out.println(ticketList);
		ModelAndView view = new ModelAndView("ViewTicketForm");
		model.addAttribute("ticketList", ticketList);
		return view;
	}
	 */
	@RequestMapping("/RaiseNewTickets")
	public ModelAndView RaiseNewTickets(@SessionAttribute("employee") Employee employee,Model model) {
		Employee employee2=employeeService.findByEmployeeName(employee.getEmployeeName());

		model.addAttribute("employeeId", employee2.getEmployeeId());
		ModelAndView modelAndView=new ModelAndView("RaiseNewTickets");
		return modelAndView;
	}


	@RequestMapping(value="/NewTickets", method=RequestMethod.GET)
	public ModelAndView raiseNewTicketOperation(@ModelAttribute("tickets") Ticket ticket) {

		employeeService.newTicket(ticket);

		return new ModelAndView("Success");
	}
	@ExceptionHandler(ResourceNotFoundException.class)
	public ModelAndView handleEmployeeNotFoundException(HttpServletRequest request, Exception ex){
		LOGGER.error("Requested URL="+request.getRequestURL());
		LOGGER.error("Exception Raised="+ex);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception", ex);
		modelAndView.addObject("url", request.getRequestURL());

		modelAndView.setViewName("error");
		return modelAndView;
	}

}
