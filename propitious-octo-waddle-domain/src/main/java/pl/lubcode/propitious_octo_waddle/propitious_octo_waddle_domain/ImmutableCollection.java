package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.util.Collection;
import java.util.Iterator;

public final class ImmutableCollection<E> implements Collection<E> {
	private final Object[] elements;
	
	public ImmutableCollection (E... elements) {
		this.elements = elements.clone( );
	}
	
	public ImmutableCollection (Collection<E> collection) {
		this.elements = new Object[collection.size( )];
		collection.toArray(this.elements);
	}

	@Override
	public boolean add(E arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addAll(Collection<? extends E> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean contains(Object arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean containsAll(Collection<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEmpty() {
		return (this.elements.length <= 0);
	}

	@Override
	public Iterator<E> iterator() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(Object arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeAll(Collection<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean retainAll(Collection<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int size() {
		return this.elements.length;
	}

	@Override
	public Object[] toArray() {
		return this.elements;
	}

	@Override
	public <T> T[] toArray(T[] arg0) {
		throw new AssertionError ("This method is yet to be implemented.");
	}

}
