package com.ProjectITIL.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.ProjectITIL.model.Employee;
import com.ProjectITIL.model.Ticket;


public interface Ticket_dao extends CrudRepository<Ticket, Integer>  {

	@Modifying
	@Query(value = "update ticket set ticket_type=? where employee_id=?",
	nativeQuery=true)
	public int updateEmployee(String var,int employeeId);

	public List<Ticket> findByEmployeeId(int employeeId);

	@Query(value = "select * FROM ticket  WHERE ticket_type=?",
			nativeQuery=true)
	public List<Ticket> findByTicketType(String ticketType);
	@Modifying
	@Query(value = "update ticket set team_member=?,ticket_type=? where ticket_id=?",
	nativeQuery=true)
	public int updateTicket(String teamMember,String var,int ticketId);
	@Query(value = "select * FROM ticket  WHERE team_member=? and ticket_type=?",
			nativeQuery=true)
	public List<Ticket> findByTeamMemberandTicketType(String teamMember,String var);

	@Modifying
	@Query(value = "update ticket set ticket_type=? where ticket_id=?",
	nativeQuery=true)
	public int updateTicketStatus(String ticketType, int ticketId);

	public Ticket findByTicketId(int ticketId);
}

