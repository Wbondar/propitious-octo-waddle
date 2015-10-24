package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;

public final class SessionCreate extends ApplicationServlet {
	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Account creator = getUserAccount(request);
		Account account = Account.getInstance(creator, username, password);
		HttpSession session = request.getSession( );
		session.setAttribute(Account.getClass( ).getName( ) + ".id", account.getId( ).toString( ));
	}
}
