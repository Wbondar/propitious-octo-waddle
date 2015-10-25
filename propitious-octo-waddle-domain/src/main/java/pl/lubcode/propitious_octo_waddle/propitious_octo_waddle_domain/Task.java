package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
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
	
	public Set<Option> getOptions ( ) {
		return options;
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

	public static Task newInstance(Account creator, Class<? extends Behaviour> classOfBehaviour, String description) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			assert creator != null;
			assert classOfBehaviour != null;
			assert description != null && !description.isEmpty( );
			Data<Task> data = dao.<Task>store("{CALL task_create(?, ?, ?)}", creator.getId( ).longValue( ), classOfBehaviour.getSimpleName( ), description);
			Identificator<Task> id = data.getId( );
			return new Task (id, new PlainTextDescription(description));
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to create task.", e);
		}
	}

	public static Set<Task> getAssessmentInstances (Identificator<Assessment> id) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Collection<Data<Task>> datas = dao.<Task>retrieveAll("SELECT * FROM standard_assessments_tasks WHERE assessment_id = ?;", id.longValue( ));
			Set<Task> tasks = new HashSet<Task> ( );
			for (Data<Task> data : datas) {
				Identificator<Task> taskId = data.getId( );
				if (taskId != null)
				{
					String description = data.getString("description");
					Set<Option> options = Option.getInstances(taskId);
					if (options != null && !options.isEmpty( )) {
						tasks.add(new Task (taskId, new PlainTextDescription (description), options));	
					}
					tasks.add(new Task (taskId, new PlainTextDescription (description)));	
				}
			}
			return tasks;
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve options by task id.", e);
		}
	}
}
