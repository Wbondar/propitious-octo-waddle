package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public final class Option implements Identifiable<Option>, Describable {
	private final Identificator<Option> id;
	private final Description           description;
	private final Reward                reward;
	
	Option (Identificator<Option> id, Description description, Reward reward) {
		this.id = id;
		this.description = description;
		this.reward = reward;
	}
	
	@Override
	public final Identificator<Option> getId( ) {
		return this.id;
	}
	
	@Override
	public final Description getDescription ( ) {
		return this.description;
	}
}
