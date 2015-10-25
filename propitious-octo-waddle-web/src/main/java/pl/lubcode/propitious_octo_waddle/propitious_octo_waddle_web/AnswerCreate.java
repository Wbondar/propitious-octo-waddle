package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Answer;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Assessment;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Task;

import javax.servlet.annotation.WebServlet;
@WebServlet(name="AnswerCreate",urlPatterns={"/answers/create"})
public final class AnswerCreate extends ApplicationServlet {
	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException
	{
		Assessment assessment = getCurrentAssessment(request);
		if (assessment != null) {
			String idOfTask = request.getParameter("task_id");
			Task task = Task.getInstance(idOfTask);
			if (task != null) {
				for (String input : request.getParameterValues("input")) {
					Answer.newInstance(assessment, task, input);
				}	
			} else {
				throw new RuntimeException ("Task is missing from current assessment.");
			}
		} else {
			throw new RuntimeException ("No current assessment.");
		}
	}
}
