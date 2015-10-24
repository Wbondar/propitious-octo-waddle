package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_datasource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		try
		(
			Connection connection = connectionFactory.getConnection( );
		)
		{
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				for (int i = 0; i < arguments.length; i++) {
					preparedStatement.setObject(i, arguments[i]);
				}
				return preparedStatement.execute( );
		}
	}

	public ResultSet executeQuery(String sql, Object... arguments) throws SQLException {
		try
		(
			Connection connection = connectionFactory.getConnection( );
		)
		{
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < arguments.length; i++) {
				preparedStatement.setObject(i, arguments[i]);
			}
			return preparedStatement.executeQuery( );
		}
	}

}
