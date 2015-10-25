package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="SessionDestroy",urlPatterns={"/sessions/destroy"})
public final class SessionDestroy extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -891122433628121875L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		request.getSession( ).invalidate( );
	}
}
