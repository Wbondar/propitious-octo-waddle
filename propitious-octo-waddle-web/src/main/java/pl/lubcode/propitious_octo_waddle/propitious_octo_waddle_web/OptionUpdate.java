package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Option;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="OptionUpdate",urlPatterns={"/options/update"})
public final class OptionUpdate extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5916595302878749055L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String idOfOptionToUpdate = request.getParameter("id");
		Option optionToUpdate = Option.getInstance(idOfOptionToUpdate);
		String updatedDescription = request.getParameter("description");
		Account updator = getUserAccount(request);
		optionToUpdate.updateDescription(updator, updatedDescription);
	}
}
