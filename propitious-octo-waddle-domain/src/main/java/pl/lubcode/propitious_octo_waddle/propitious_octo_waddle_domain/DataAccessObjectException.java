package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.sql.SQLException;

public class DataAccessObjectException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7159611087578949070L;

	public DataAccessObjectException(SQLException e) {
		super(e);
	}

}
