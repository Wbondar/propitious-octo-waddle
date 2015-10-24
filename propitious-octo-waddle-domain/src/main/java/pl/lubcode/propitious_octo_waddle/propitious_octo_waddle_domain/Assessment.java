package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public final class Assessment implements Identifiable<Assessment> {
	private final Identificator<Assessment> id;
	private final Task task;
	private final Student student;
	private final int amountOfPoints;
	
	private Assessment (Identificator<Assessment> id, Task task, Student student, int amountOfPoints) {
		this.id = id;
		this.task = task;
		this.student = student;
		this.amountOfPoints = amountOfPoints;
	}
	
	@Override
	public Identificator<Assessment> getId ( ) {
		return this.id;
	}

	public Task getTask() {
		return task;
	}

	public Student getStudent() {
		return student;
	}
}
