package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public final class PlainTextDescription extends Description {
	private final String content;
	
	PlainTextDescription (String content) {
		this.content = content;
	}
	
	@Override
	public final String toString ( ) {
		return this.content;
	}
}
