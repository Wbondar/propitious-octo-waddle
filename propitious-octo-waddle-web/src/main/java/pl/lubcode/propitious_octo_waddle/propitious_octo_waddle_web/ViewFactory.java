package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_web;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.IContext;
import org.thymeleaf.context.WebContext;

enum ViewFactory {
	INSTANCE (ThymeleafTemplateEngine.getInstance( ));
	
	private final TemplateEngine templateEngine;
	
	private ViewFactory (TemplateEngine templateEngine) {
		this.templateEngine = templateEngine;
	}
	
	public static ViewFactory getInstance ( ) {
		return INSTANCE;
	}
	
	private void process
	(
		HttpServletRequest request,
		HttpServletResponse response,
		String pathToTemplate,
		IContext context
	)
	throws IOException {
		this.templateEngine.process(pathToTemplate, context, response.getWriter( ));
	}
	
	private static WebContext getContext (HttpServletRequest request, HttpServletResponse response) {
		return new WebContext (request, response, request.getServletContext( ), request.getLocale( ));
	}
	
	public void process
	(
		HttpServletRequest request, 
		HttpServletResponse response,
		String pathToTemplate
	)
	throws IOException {

		WebContext webContext = getContext(request, response);
		Enumeration<String> names = request.getAttributeNames( );
		while (names.hasMoreElements( )) {
			String name = names.nextElement( );
			webContext.setVariable(name, request.getAttribute(name));
		}
		this.process(request, response, pathToTemplate, webContext);
	}
	
	public void process 
	(
			HttpServletRequest request,
			HttpServletResponse response
	)
	throws IOException {
		String pathToTemplate = request.getRequestURI().substring(request.getContextPath().length() + 1);
		if (pathToTemplate == null || pathToTemplate.isEmpty( )) {
			pathToTemplate = "index";
		}
		process(request, response, pathToTemplate);
	}
}
