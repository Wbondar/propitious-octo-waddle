package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;
import java.util.NoSuchElementException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Assessment;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Identificator;

abstract class ApplicationServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2596917501494935620L;
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
		Account loggedInUser = null;
		HttpSession session = request.getSession(false);
		if (session == null) {
			return null;
		}
		try
		{
			loggedInUser = Account.getInstance(Identificator.<Account>valueOf((String)session.getAttribute(Account.class.getName( ) + ".id")));
		} catch (NumberFormatException e) {
			return null;
		} catch (NoSuchElementException e) {
			return null;
		}
		return loggedInUser;
	}
	
	protected final Assessment getCurrentAssessment (HttpServletRequest request) {
		Assessment currentAssessment = null;
		HttpSession session = request.getSession(false);
		if (session == null) {
			return null;
		}
		try
		{
			currentAssessment = Assessment.getInstance(Identificator.<Assessment>valueOf((String)session.getAttribute(Assessment.class.getName( ) + ".id")));
		} catch (NumberFormatException e) {
			return null;
		} catch (NoSuchElementException e) {
			return null;
		}
		return currentAssessment;
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
