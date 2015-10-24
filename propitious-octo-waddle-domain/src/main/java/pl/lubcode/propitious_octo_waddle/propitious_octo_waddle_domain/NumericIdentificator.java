package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public class NumericIdentificator<T> extends Number implements Identificator<T> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8848357130734524502L;

	private final Number number;
	
	private NumericIdentificator (Number number) {
		this.number = number;
	}
	
	public static <E> NumericIdentificator<E> valueOf(String string) {
		return new NumericIdentificator<E> (Long.valueOf(string));
	}

	@Override
	public double doubleValue() {
		return this.number.doubleValue();
	}

	@Override
	public float floatValue() {
		return this.number.floatValue();
	}

	@Override
	public int intValue() {
		return this.number.intValue();
	}

	@Override
	public long longValue() {
		return this.number.longValue();
	}
}
