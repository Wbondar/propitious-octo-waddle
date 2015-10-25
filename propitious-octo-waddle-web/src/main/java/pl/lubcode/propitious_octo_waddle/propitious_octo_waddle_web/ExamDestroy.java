package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.*;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="ExamDestroy",urlPatterns={"/exams/destroy"})
public final class ExamDestroy extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4508581202543734496L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String[] idsOfExamsToDestroy = request.getParameterValues("id");
		Account destroyer = getUserAccount(request);
		for (String id: idsOfExamsToDestroy) {
			Exam.getInstance(id).destroy(destroyer);
		}
	}
}
