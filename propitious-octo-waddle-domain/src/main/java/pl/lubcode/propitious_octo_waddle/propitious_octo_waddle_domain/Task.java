package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.util.Set;

public final class Task implements Identifiable<Task>, Describable {
	private final Identificator<Task> id;
	private final Description         description;
	private final Set<Option>         options;
	
	private Task (Identificator<Task> id, Description description, Set<Option> options) {
		this.id = id;
		this.description = description;
		this.options = options;
	}
	
	@Override
	public Description getDescription ( ) {
		return this.description;
	}
	@Override
	public Identificator<Task> getId ( ) {
		return this.id;
	}
}
