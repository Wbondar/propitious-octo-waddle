package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Exam;


import javax.servlet.annotation.WebServlet;

@WebServlet(name="ExamUpdate",urlPatterns={"/exams/update"})
public final class ExamUpdate extends ApplicationServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1494086583264529998L;

	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String idOfExamToUpdate = request.getParameter("id");
		Exam examToUpdate = Exam.getInstance(idOfExamToUpdate);
		String updatedTitle = request.getParameter("title");
		Account updator = getUserAccount(request);
		examToUpdate.updateTitle(updator, updatedTitle);
	}
}
