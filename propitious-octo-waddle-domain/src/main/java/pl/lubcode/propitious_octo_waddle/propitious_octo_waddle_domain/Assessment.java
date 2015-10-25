package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.util.Collections;
import java.util.Set;

public final class Assessment implements Identifiable<Assessment> {
	private final Identificator<Assessment> id;
	private final Exam exam;
	private final Account student;
	private final Set<Task> tasks;
	
	private Assessment (Identificator<Assessment> id, Account student, Exam exam, Set<Task> tasks) {
		this.id = id;
		this.exam = exam;
		this.student = student;
		this.tasks = tasks;
	}
	
	private Assessment (Identificator<Assessment> id, Account student, Exam exam) {
		this(id, student, exam, Collections.<Task>emptySet( ));
	}
	
	@Override
	public Identificator<Assessment> getId ( ) {
		return this.id;
	}

	public Set<Task> getTasks() {
		return tasks;
	}
	
	public Exam getExam ( ) {
		return this.exam;
	}

	public Account getStudent() {
		return student;
	}

	public static Assessment newInstance(Exam exam, Account account) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Assessment> data = dao.<Assessment>store("{CALL assessment_create(?, ?)}", exam.getId( ).longValue( ), account.getId( ).longValue( ));
			if (data != null)
			{
				Identificator<Assessment> id = data.getId( );
				if (id != null) {
					return getInstance(id);	
				}
			}
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to create assessment.", e);
		}
		return null;
	}

	public static Assessment getInstance(Identificator<Assessment> id) {
		try {
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Task> data = dao.<Task>retrieve("SELECT * FROM standard_assessments WHERE id = ?;", id.longValue( ));
			Identificator<Account> accountId = data.<Account>getId("student_id");
			Identificator<Exam> examId = data.<Exam>getId("exam_id");
			Exam exam = Exam.getInstance(examId);
			if (exam == null) {
				throw new RuntimeException ("Exam is missing.");
			}
			Account account = Account.getInstance(accountId);
			if (account == null) {
				throw new RuntimeException ("Student is missing.");
			}
			Set<Task> tasks = Task.getAssessmentInstances(id);
			if (tasks != null && !tasks.isEmpty( )) {
				return new Assessment (id, account, exam, tasks);	
			}
			return new Assessment (id, account, exam);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve exam.", e);
		}
	}
	
	public static Assessment getInstance (String id) {
		return getInstance(Identificator.<Assessment>valueOf(id));
	}
}
