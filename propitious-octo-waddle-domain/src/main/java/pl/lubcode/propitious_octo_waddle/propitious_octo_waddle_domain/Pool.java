package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public final class Pool implements Identifiable {
	private final Identificator<Pool> id;
	private final String title;

	private Pool(Identificator<Pool> id, String title) {
		this.id = id;
		this.title = title;
	}

	public static Pool getInstance(Identificator<Pool> id) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Pool> data = dao.<Pool>retrieve("SELECT * FROM standard_pools WHERE id = ?;", id.longValue( ));
			String title = data.getString("title");
			return new Pool (id, title);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve pool.", e);
		}
	}

	public Identificator<Pool> getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public static Pool getInstance (String id) {
		return getInstance(Identificator.<Pool>valueOf(id));
	}

	public boolean destroy(Account destroyer) {
		return false;
	}

	public static Pool newInstance(Account creator, String title) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Pool> data = dao.<Pool>retrieve("{CALL pool_create(?, ?)}", creator.getId( ).longValue( ), title);
			Identificator<Pool> id = data.getId( );
			return new Pool (id, title);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to create pool.", e);
		}
	}

	public Pool updateTitle(Account updator, String updatedTitle) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			boolean success = dao.execute("{CALL pool_update(?, ?, ?)}", this.id.longValue( ), updator.getId( ).longValue( ), updatedTitle);
			if (success) {
				return new Pool (this.id, updatedTitle);
			}
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to update pool.", e);
		}
		return this;
	}
}
