package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public final class Answer implements Identifiable<Answer> {
	private final Identificator<Answer> id;
	private final Assessment assessment;
	private final Task task;
	private final String input;
	
	private Answer (Identificator<Answer> id, Assessment assessment, Task task,  String input) {
		this.id = id;
		this.assessment = assessment;
		this.task = task;
		this.input = input;
	}
	
	public static Answer newInstance (Assessment assessment, Task task, String input) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Answer> data = dao.<Answer>store("{CALL answer_create (?, ?, ?)}", assessment.getId( ).longValue( ), task.getId( ).longValue( ), input);
			return new Answer (data.getId( ), assessment, task, input);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to create answer.", e);
		}
	}

	@Override
	public Identificator<Answer> getId() {
		return this.id;
	}
	
	public Assessment getAssessment ( ) {
		return assessment;
	}
	
	public Task getTask ( ) {
		return task;
	}
	
	public String getInput ( ) {
		return input;
	}
	
	@Override
	public String toString ( ) {
		return this.input;
	}
}
