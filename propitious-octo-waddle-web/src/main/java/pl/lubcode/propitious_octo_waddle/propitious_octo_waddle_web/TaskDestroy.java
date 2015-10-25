package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Task;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="TaskDestroy",urlPatterns={"/tasks/destroy"})
public final class TaskDestroy extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8444401159386555973L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String[] idsOfTasksToDestroy = request.getParameterValues("id");
		Account destroyer = getUserAccount(request);
		for (String id: idsOfTasksToDestroy) {
			Task.getInstance(id).destroy(destroyer);
		}
	}
}
