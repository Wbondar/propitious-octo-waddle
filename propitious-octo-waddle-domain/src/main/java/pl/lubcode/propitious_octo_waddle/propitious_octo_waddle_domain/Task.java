package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.util.Collections;
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
	
	private Task(Identificator<Task> id, Description description) {
		this(id, description, Collections.<Option>emptySet( ));
	}

	@Override
	public Description getDescription ( ) {
		return this.description;
	}
	@Override
	public Identificator<Task> getId ( ) {
		return this.id;
	}

	public static Task getInstance(String id) {
		return getInstance(Identificator.<Task>valueOf(id));
	}

	public static Task getInstance(Identificator<Task> id) {
		try {
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Task> data = dao.<Task>retrieve("SELECT * FROM standard_tasks WHERE id = ?;", id.longValue( ));
			String description = data.getString("description");
			Set<Option> options = Option.getInstances(id);
			if (options != null && !options.isEmpty( )) {
				return new Task (id, new PlainTextDescription (description), options);	
			}
			return new Task (id, new PlainTextDescription (description));
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve exam.", e);
		}
	}

	public Task updateDescription (Account updator, String updatedDescription) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			boolean success = dao.execute("{CALL task_update(?, ?, ?)}", this.id.longValue( ), updator.getId( ).longValue( ), updatedDescription);
			if (success) {
				return new Task (this.id, new PlainTextDescription (updatedDescription), this.options);
			}
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to update task.", e);
		}
		return this;
	}

	public boolean destroy(Account destroyer) {
		return false;
	}

	public static Task newInstance(Account creator, String description) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Task> data = dao.<Task>retrieve("{CALL task_create(?, ?)}", creator.getId( ).longValue( ), description);
			Identificator<Task> id = data.getId( );
			return new Task (id, new PlainTextDescription(description));
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to create task.", e);
		}
	}
}
