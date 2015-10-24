package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_datasource;

import java.sql.Connection;
import java.sql.SQLException;

interface ConnectionFactory {
	Connection getConnection ( ) throws SQLException;
}
