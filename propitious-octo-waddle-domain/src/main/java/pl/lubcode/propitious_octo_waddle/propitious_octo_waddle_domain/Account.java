package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public final class Account implements Identifiable<Account> {
	private final Identificator<Account> id;
	private final Account creator;
	private final String username;
	private final String password;
	
	private Account (Identificator<Account> id, Account creator, String username, String password) {
		this.id = id;
		this.creator = creator;
		this.username = username;
		this.password = password;
	}
	
	private Account (Identificator<Account> id, String username, String password) {
		this(id, null, username, password);
	}
	
	public static Account newInstance (Account creator, String username, String password) {
		if (creator == null) {
			return newInstance(username, password);
		}
		return new Account (creator, username, password);
	}
	
	public static Account newInstance (String username, String password) {
		return new Account (username, password);
	}
	
	@Override
	public final Identificator<Account> getId ( ) {
		return this.id;
	}
}
