package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_datasource.NativeStatementFactory;
import pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_datasource.StatementFactory;

public enum DataAccessObject {
	INSTANCE;
	
	private final StatementFactory statementFactory;
	
	private DataAccessObject (StatementFactory statementFactory) {
		this.statementFactory = statementFactory;
	}
	
	private DataAccessObject ( ) {
		this(NativeStatementFactory.INSTANCE);
	}
	
	final class NativeData<V> implements Data<V> {
		private final Map<String, Object> mapping = new HashMap<String, Object> ( );
		
		NativeData ( ) {}
		
		public Object put (String columnName, Object object) {
			return mapping.put(columnName, object);
		}

		@Override
		public <E> Identificator<E> getId (String columnName) {
			return Identificator.<E>valueOf(mapping.get(columnName));
		}

		@Override
		public Object get(String key) {
			return mapping.get(key);
		}

		@Override
		public <E> E get(String key, Class<E> type) {
			return type.cast(mapping.get(key));
		}

		@Override
		public Identificator<V> getId ( ) {
			return Identificator.<V>valueOf(mapping.get("id"));
		}

		@Override
		public String getString(String columnName) {
			return get(columnName, String.class);
		}

		@Override
		public Integer getInteger(String columnName) {
			return get(columnName, Integer.class);
		}
		
	}
	
	public static DataAccessObject getInstance ( ) {
		return INSTANCE;
	}
	
	public final <T> Collection<Data<T>> retrieveAll (String sql, Object... arguments) throws DataAccessObjectException {
		try
		{
			ResultSet resultSet = statementFactory.executeQuery(sql, arguments);
			ResultSetMetaData md = resultSet.getMetaData( );
			List<Data<T>> datas = new ArrayList<Data<T>> ( );
			while (resultSet.next( )) {
				NativeData<T> nativeData = new NativeData<T> ( );
				for (int i = 0; i < md.getColumnCount( ); i++) {
					nativeData.put(md.getColumnName(i), resultSet.getObject(i));
				}
				datas.add(nativeData);
			}
			return datas;
		} catch (SQLException e) {
			throw new DataAccessObjectException (e);
		}
	}
	
	public final <T> Data<T> retrieve (String sql, Object... arguments) throws DataAccessObjectException {
		return this.<T>retrieveAll(sql, arguments).iterator().next();
	}

	public boolean execute(String sql, Object... arguments) throws DataAccessObjectException {
		try {
			return statementFactory.execute(sql, arguments);
		} catch (SQLException e) {
			throw new DataAccessObjectException (e);
		}
	}
}
