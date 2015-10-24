package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Pool;

public final class PoolDestroy extends ApplicationServlet {
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
