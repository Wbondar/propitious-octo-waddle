package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_datasource;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public enum DataSourceConnectionFactory implements ConnectionFactory {
	INSTANCE ( );
	
	private final DataSource dataSource;
	
	private DataSourceConnectionFactory (DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	private DataSourceConnectionFactory ( ) {
		try
		{
			this.dataSource = (DataSource)(new InitialContext( )).lookup("java:/comp/env/jdbc/DefaultDatabase");	
		} catch (Exception e) {
			throw new AssertionError ("Failed to connect to the database.", e);
		}
	}
	

	public Connection getConnection ( ) throws SQLException {
		return dataSource.getConnection( );
	}
}
