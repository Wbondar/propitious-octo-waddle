package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

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
			Data<Account> data = dao.<Account>retrieve("{CALL account_create(?, ?, ?)}", idOfCreator, username, hashPassword(password));
			Identificator<Account> id = data.getId( );
			return new Account (id, username);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to create an account.", e);
		}
	}

	public static Account newInstance (String username, String password) {
		return newInstance (null, username, password);
	}
	
	private static String hashPassword(String password) {
		try
		{
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			byte[] input = messageDigest.digest(password.getBytes("UTF-8"));
			return new String(input, StandardCharsets.UTF_8);	
		} catch (Exception e) {
			throw new AssertionError ("Failed to hash password.", e);
		}
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
}
