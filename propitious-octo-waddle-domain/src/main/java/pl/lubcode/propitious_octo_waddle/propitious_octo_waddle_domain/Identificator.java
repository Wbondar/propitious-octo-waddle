package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public class Identificator<T> extends Number {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8848357130734524502L;

	private final Number number;
	
	private Identificator (Number number) {
		this.number = number;
	}
	
	public static <E> Identificator<E> valueOf(String string) {
		return new Identificator<E> (Long.valueOf(string));
	}
	
	public static <E> Identificator<E> valueOf (Object object) {
		if (object instanceof Number) {
			return new Identificator<E>((Number)object);
		}
		throw new RuntimeException ("Argument is not a number.");
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
