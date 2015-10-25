package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

import org.mindrot.jbcrypt.BCrypt;

public final class Account implements Identifiable<Account> {
	private final Identificator<Account> id;
	private final String username;
	
	private Account (Identificator<Account> id, String username) {
		assert id != null;
		this.id = id;
		assert username != null && !username.isEmpty( );
		this.username = username;
	}
	
	private Account (Identificator<Account> id, String username, String password) {
		this(id, username);
	}
	
	public static Account newInstance (Account creator, String username, String password) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Long idOfCreator = null;
			if (creator != null) {
				idOfCreator = creator.getId( ).longValue( );
			}
			Data<Account> data = dao.<Account>store("{CALL account_create(?, ?, ?)}", idOfCreator, username.toUpperCase( ), BCrypt.hashpw(password, BCrypt.gensalt( )));
			Identificator<Account> id = data.getId( );
			return new Account (id, username);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to create an account.", e);
		}
	}

	public static Account newInstance (String username, String password) {
		return newInstance (null, username, password);
	}
	
	@Override
	public final Identificator<Account> getId ( ) {
		return this.id;
	}
	
	public final String getName ( ) {
		return this.username;
	}

	public static Account getInstance(Identificator<Account> id) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Account> data = dao.<Account>retrieve("SELECT * FROM standard_accounts WHERE id = ?;", id.longValue( ));
			String username = data.getString("username");
			return new Account (id, username);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve account.", e);
		}
	}

	public static Account getInstance (String username, String password) {
		try
		{
			assert username != null && !username.isEmpty( );
			assert password != null && !password.isEmpty( );
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Account> data = dao.<Account>retrieve("SELECT * FROM standard_accounts WHERE UPPER(username) = UPPER(?);", username.toUpperCase( ));
			String hash = data.getString("password");
			if (hash == null || hash.isEmpty( )) {
				throw new RuntimeException ("Password hash is missing.");
			}
			if (BCrypt.checkpw(password, hash)) {
				username = data.getString("username");
				return new Account (data.getId( ), username);
			}
			return null;
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve account.", e);
		}
	}
}
