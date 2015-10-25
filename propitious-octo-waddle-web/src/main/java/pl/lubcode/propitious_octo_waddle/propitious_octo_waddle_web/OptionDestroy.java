package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Option;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="OptionDestroy",urlPatterns={"/options/destroy"})
public final class OptionDestroy extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1023929151809384143L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String[] idsOfOptionsToDestroy = request.getParameterValues("id");
		Account destroyer = getUserAccount(request);
		for (String id: idsOfOptionsToDestroy) {
			Option.getInstance(id).destroy(destroyer);
		}
	}
}
