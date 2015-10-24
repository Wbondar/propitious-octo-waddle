package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Account;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Task;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain.Option;

public final class OptionCreate extends ApplicationServlet {
	@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException 
	{
		String idOfTaskToAddOptionTo = request.getParameter("task_id");
		Task taskToAddOptionTo = Task.getInstance(idOfTaskToAddOptionTo);
		String[] descriptionsOfNewOptions = request.getParameterValues("description");
		String[] rewardsForNewOptions = request.getParameterValues("reward");
		Account creator = getUserAccount(request);
		for (int i = 0; i < descriptionsOfNewOptions.length; i++) {
			String descriptionOfNewOption = descriptionsOfNewOptions[i];
			String rewardForNewOption = rewardsForNewOptions[i];
			Option newOption = Option.newInstance(creator, taskToAddOptionTo, descriptionOfNewOption, rewardForNewOption);
		}
	}
}
