package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Assessment;

@WebServlet(name="AssessmentRetrieve",urlPatterns={"/assessments/retrieve"})
public final class AssessmentRetrieve extends ApplicationServlet {
	@Override
	public void doGet (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
		Assessment assessment = null;
		String idOfAssessment = request.getParameter("id");
		if (idOfAssessment != null && !idOfAssessment.isEmpty( )) {
			assessment = Assessment.getInstance(idOfAssessment);
		} else {
			assessment = getCurrentAssessment(request);
		}
		if (assessment == null) {
			throw new RuntimeException ("Assessment is missing.");
		}
		request.setAttribute("assessment", assessment);
		super.doGet(request, response);
	}
}
