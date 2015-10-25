package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.*;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="ExamCreate",urlPatterns={"/exams/create"})
public final class ExamCreate extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4804184049018020050L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String[] titles = request.getParameterValues("title");
		Account creator = getUserAccount(request);
		for (String title : titles) {
			Exam.newInstance(creator, title);	
		}
	}
}
