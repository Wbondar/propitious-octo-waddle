package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Assessment;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Exam;

@WebServlet(name="AssessmentCreate",urlPatterns={"/assessments/create"})
public final class AssessmentCreate extends ApplicationServlet {
	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException
	{
		Account account = getUserAccount(request);
		if (account == null) {
			throw new RuntimeException ("Log in to the system first.");
		}
		Assessment currentAssessment = getCurrentAssessment(request);
		if (currentAssessment != null) {
			throw new RuntimeException ("Assessment is on-going.");
		}
		Exam exam = Exam.getInstance(request.getParameter("exam_id"));
		if (exam != null) {
			Assessment assessment = Assessment.newInstance(exam, account);
			HttpSession session = request.getSession( );
			session.setAttribute(Assessment.class.getName( ) + ".id", assessment.getId( ).toString( ));	
		} else {
			throw new RuntimeException ("Exam does not exist.");
		}
		response.sendRedirect("/assessments/retrieve");
	}
	
	@Override
	public void doGet (HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setAttribute("exams", Exam.getInstances( ));
		super.doGet(request, response);
	}
}
