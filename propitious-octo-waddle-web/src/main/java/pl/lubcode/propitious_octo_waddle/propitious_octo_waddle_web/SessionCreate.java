package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="SessionCreate",urlPatterns={"/sessions/create"})
public final class SessionCreate extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1320583102412449359L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String username = request.getParameter("username");
		if (username == null || username.isEmpty( )) {
			throw new RuntimeException ("Username is missing.");
		}
		String password = request.getParameter("password");
		if (password == null || password.isEmpty( )) {
			throw new RuntimeException ("Password is missing.");
		}
		Account account = getUserAccount(request);
		if (account == null) {
			account = Account.getInstance(username, password);
			HttpSession session = request.getSession( );
			session.setAttribute(Account.class.getName( ) + ".id", account.getId( ).toString( ));	
		}
	}
}
