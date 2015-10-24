package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;

abstract class ApplicationServlet extends HttpServlet {
	private final ViewFactory viewFactory;
	
	ApplicationServlet (ViewFactory viewFactory) {
		this.viewFactory = viewFactory;
	}
	
	ApplicationServlet ( ) {
		this(ViewFactory.getInstance( ));
	}
	
	protected final ViewFactory getViewFactory ( ) {
		return this.viewFactory;
	}
	
	protected final Account getUserAccount (HttpServletRequest request) {
		return Account.getInstance(request.getSession( ).getAttribute(Account.class.getName( ) + ".id"));
	}
	
	@Override
	public void doGet (HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException
	{
		getViewFactory( ).process(request, response);
	}
	
	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException
	{
		doGet(request, response);
	}
}
