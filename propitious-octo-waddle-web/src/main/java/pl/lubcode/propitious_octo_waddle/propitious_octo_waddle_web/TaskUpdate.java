package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Task;

public final class TaskUpdate extends ApplicationServlet {
	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String idOfPoolToUpdate = request.getParameter("id");
		Task poolToUpdate = Task.getInstance(idOfPoolToUpdate);
		String updatedDescription = request.getParameter("description");
		Account updator = getUserAccount(request);
		poolToUpdate.updateTitle(updator, updatedDescription);
	}
}
