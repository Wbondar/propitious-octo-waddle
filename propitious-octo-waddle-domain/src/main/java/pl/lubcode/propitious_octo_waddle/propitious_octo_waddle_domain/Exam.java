package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public final class Exam implements Identifiable<Exam> {
	private final Identificator<Exam> id;
	private final String title;
	
	private Exam(Identificator<Exam> id, String title) {
		this.id = id;
		this.title = title;
	}

	public static Exam newInstance(Account creator, String title) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Exam> data = dao.<Exam>retrieve("{CALL exam_create(?, ?)}", creator.getId( ).longValue( ), title);
			Identificator<Exam> id = data.getId( );
			return new Exam (id, title);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to create exam.", e);
		}
	}

	@Override
	public Identificator<Exam> getId() {
		return this.id;
	}

	public String getTitle ( ) {
		return title;
	}

	public static Exam getInstance(String id) {
		return getInstance(Identificator.<Exam>valueOf(id));
	}

	public static Exam getInstance(Identificator<Exam> id) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Exam> data = dao.<Exam>retrieve("SELECT * FROM standard_exams WHERE id = ?;", id.longValue( ));
			String title = data.getString("title");
			return new Exam (id, title);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve exam.", e);
		}
	}

	public Exam updateTitle(Account updator, String updatedTitle) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			boolean success = dao.execute("{CALL exam_update(?, ?, ?)}", this.id.longValue( ), updator.getId( ).longValue( ), updatedTitle);
			if (success) {
				return new Exam (this.id, updatedTitle);
			}
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to update exam.", e);
		}
		return this;
	}

	public boolean destroy(Account destroyer) {
		return false;
	}
}
