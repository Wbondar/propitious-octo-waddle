package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Pool;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="PoolDestroy",urlPatterns={"/pools/destroy"})
public final class PoolDestroy extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8190030140884207980L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String[] idsOfPoolsToDestroy = request.getParameterValues("id");
		Account destroyer = getUserAccount(request);
		for (String id: idsOfPoolsToDestroy) {
			Pool.getInstance(id).destroy(destroyer);
		}
	}
}
