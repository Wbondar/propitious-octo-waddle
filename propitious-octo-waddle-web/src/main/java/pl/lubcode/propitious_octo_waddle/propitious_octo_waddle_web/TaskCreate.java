package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Task;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="TaskCreate",urlPatterns={"/tasks/create"})
public final class TaskCreate extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4921340892996665677L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String descriptionOfNewTask = request.getParameter("description");
		Account creator = getUserAccount(request);
		Task newTask = Task.newInstance(creator, descriptionOfNewTask);
	}
}
