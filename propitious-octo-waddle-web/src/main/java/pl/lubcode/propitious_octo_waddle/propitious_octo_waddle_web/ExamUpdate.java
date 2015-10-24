package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Exam;

public final class ExamUpdate extends ApplicationServlet {
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
