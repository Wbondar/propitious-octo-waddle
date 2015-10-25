package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_datasource;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface StatementFactory {
	boolean execute (String sql, Object... arguments) throws SQLException;
	
	ResultSet executeQuery (String sql, Object... arguments) throws SQLException;

	ResultSet executeProcedure(String sql, Object... arguments) throws SQLException;
}
