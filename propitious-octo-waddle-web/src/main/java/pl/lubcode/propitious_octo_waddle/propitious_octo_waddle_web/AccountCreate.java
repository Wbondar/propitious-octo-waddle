package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="AccountCreate",urlPatterns={"/accounts/create"})
public final class AccountCreate extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6162255668922599012L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Account creator = getUserAccount(request);
		Account.newInstance(creator, username, password);
	}
}
