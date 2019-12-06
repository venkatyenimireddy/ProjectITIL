package com.ProjectITIL.service;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ProjectITIL.dao.Itil_dao;
import com.ProjectITIL.dao.Ticket_dao;
import com.ProjectITIL.exception.ResourceNotFoundException;
import com.ProjectITIL.model.Employee;
import com.ProjectITIL.model.Ticket;



@Service
public class EmployeeService implements IEmployeeService {

	@Autowired
	public Itil_dao itil_dao;
	@Autowired
	public Ticket_dao ticket_dao;

	private static final Logger LOGGER = LoggerFactory.getLogger(EmployeeService.class);

	@Override
	public Employee findRole(Employee employee) {
		if(employee==null)
		{
			LOGGER.error("No such Employee exists!");
			throw new ResourceNotFoundException("No such Employee exist");
		}
		else
		{

			return this.itil_dao.findByEmployeeNameAndPassword(employee.getEmployeeName(),employee.getPassword());
		}

	}

	@Override
	public List<Ticket> myTickets(int employeeId) {
		if(employeeId==0)
		{
			LOGGER.error("No such Employee exists!");
			throw new ResourceNotFoundException("No such Employee exist");
		}
		else
		{
			return this.ticket_dao.findByEmployeeId(employeeId);
		}
	}
	@Transactional
	@Override
	public Ticket newTicket(Ticket ticket) {
		if(ticket==null)
		{
			LOGGER.error("Ticket Details not Found");
			throw new ResourceNotFoundException("Not a valid entry");
		}
		else
		{
			String var="New Ticket";

			Ticket ticket1=ticket_dao.save(ticket);
			int i=ticket_dao.updateEmployee(var, ticket.getEmployeeId());
			return ticket1;
		}	

	}

	@Override
	public List<Ticket> viewNewTickets() {

		String ticketType="New Ticket";
		return this.ticket_dao.findByTicketType(ticketType);
	}



	@Override
	public List<Employee> teammembers() throws SQLException {
		String role="Team member";
		List<Employee> teamMemebers=this.itil_dao.findByEmployeeRole(role);
		if(teamMemebers==null)
		{
			LOGGER.error("No employees assigned as team members");
			throw new SQLException("SQLException");
		}
		else
		{
			return teamMemebers;
		}
	}

	@Transactional
	@Override
	public int updateTicket(String teamMember, int ticketId) throws Exception {
		String var="Assigned";
		int update=this.ticket_dao.updateTicket(teamMember, var, ticketId);
		if(update==0)
		{
			LOGGER.error("No members assigned to the ticket");
			throw new Exception("Exception");
		}
		else
		{
			return this.ticket_dao.updateTicket(teamMember, var, ticketId);
		}
	}

	@Override
	public List<Ticket> viewAssignedTickets(String teamMember) {

		String var="Assigned";
		return this.ticket_dao.findByTeamMemberandTicketType(teamMember, var);
	}

	@Transactional
	@Override
	public int updateTicketStatus(String ticketType, int ticketId) throws Exception {

		int update= this.ticket_dao.updateTicketStatus(ticketType,ticketId);
		if(update==0)
		{
			LOGGER.error("No members assigned to the ticket");
			throw new Exception("Exception");
		}
		else
		{
			return update;
		}
	}

	@Override
	public Ticket ticketDetails(int ticketId) {

		return this.ticket_dao.findByTicketId(ticketId);
	}

	@Override
	public Employee findByEmployeeName(String employeeName) {

		return this.itil_dao.findByEmployeeName(employeeName);
	}


}
