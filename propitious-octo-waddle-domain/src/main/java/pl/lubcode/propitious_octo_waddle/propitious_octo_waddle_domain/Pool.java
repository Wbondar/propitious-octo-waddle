package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public final class Pool implements Identifiable<Pool> {
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

	public static Set<Pool> getInstances(Identificator<Exam> id) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Collection<Data<Pool>> datas = dao.<Pool>retrieveAll("SELECT * FROM standard_exams_pools WHERE exam_id = ?;", id.longValue( ));
			Set<Pool> pools = new HashSet<Pool> ( );
			for (Data<Pool> data : datas) {
				Identificator<Pool> poolId = data.getId( );
				if (poolId != null)
				{
					pools.add(new Pool (poolId, data.getString("title")));	
				}
			}
			return pools;
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve options by task id.", e);
		}
	}
}
