package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public final class Reward extends Number {
	private final int amount;
	
	Reward (int amount) {
		this.amount = amount;
	}

	@Override
	public double doubleValue() {
		return (double)this.amount;
	}

	@Override
	public float floatValue() {
		return (float)this.amount;
	}

	@Override
	public int intValue() {
		return this.amount;
	}

	@Override
	public long longValue() {
		return (long)this.amount;
	}

}
