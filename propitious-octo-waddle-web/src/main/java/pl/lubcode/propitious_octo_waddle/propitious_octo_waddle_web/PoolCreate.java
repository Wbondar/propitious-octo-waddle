package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Pool;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="PoolCreate",urlPatterns={"/pools/create"})
public final class PoolCreate extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -320690394538861294L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String[] titles = request.getParameterValues("title");
		Account creator = getUserAccount(request);
		for (String title : titles) {
			Pool.newInstance(creator, title);	
		}
	}
}
