package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.sql.SQLException;

public class DataAccessObjectException extends Exception {

	public DataAccessObjectException(SQLException e) {
		super(e);
	}

}
