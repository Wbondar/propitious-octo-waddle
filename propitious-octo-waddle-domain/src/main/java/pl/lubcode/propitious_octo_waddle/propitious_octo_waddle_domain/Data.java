package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

public interface Data<T> {
	Object get (String key);
	<E> E get (String key, Class<E> type);
	<E> Identificator<E> getId(String columnName);
	Identificator<T> getId( );
	String getString(String columnName);
	Integer getInteger(String columnName);
}
