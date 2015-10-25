package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_datasource;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public enum NativeStatementFactory implements StatementFactory {
	INSTANCE;
	
	private final ConnectionFactory connectionFactory;
	
	NativeStatementFactory (ConnectionFactory connectionFactory) {
		this.connectionFactory = connectionFactory;
	}
	
	NativeStatementFactory ( ) {
		this(DataSourceConnectionFactory.INSTANCE);
	}
	
	public static StatementFactory getInstance ( ) {
		return INSTANCE;
	}
	
	public boolean execute(String sql, Object... arguments) throws SQLException {
		Connection connection = null;
		try
		{
			connection = connectionFactory.getConnection( );
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < arguments.length; i++) {
				preparedStatement.setObject(i + 1, arguments[i]);
			}
			return preparedStatement.execute( );
		} finally {
			if (connection != null) {
				connection.close( );
			}
		}
	}

	public ResultSet executeQuery(String sql, Object... arguments) throws SQLException {
		Connection connection = null;
		try
		{
			connection = connectionFactory.getConnection( );
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < arguments.length; i++) {
				preparedStatement.setObject(i + 1, arguments[i]);
			}
			return preparedStatement.executeQuery( );
		} finally {
			if (connection != null) {
				connection.close( );
			}
		}
	}

	public ResultSet executeProcedure (String sql, Object... arguments) throws SQLException {
		Connection connection = null;
		try
		{
			connection = connectionFactory.getConnection( );
			CallableStatement preparedStatement = connection.prepareCall(sql);
			for (int i = 0; i < arguments.length; i++) {
				preparedStatement.setObject(i + 1, arguments[i]);
			}
			return preparedStatement.executeQuery( );
		} finally {
			if (connection != null) {
				connection.close( );
			}
		}
	}

}
