/*
 * From http://stackoverflow.com/questions/268672/is-there-a-no-duplicate-list-implementation-out-there/268818#268818
 *
 * When I get up to importing 3rd party jars, replace with  the Commons Collections (or collections15,
 * for the generic version) has a List which does what you want already: SetUniqueList.
 */
package localutils;

import java.util.Collection;
import java.util.LinkedList;

/**
 *
 * @author Yuval
 */
public class NoDuplicatesList<E> extends LinkedList<E> {
    @Override
    public boolean add(E e) {
        if (this.contains(e)) {
            return false;
        }
        else {
            return super.add(e);
        }
    }

    @Override
    public boolean addAll(Collection<? extends E> collection) {
        Collection<E> copy = new LinkedList<>(collection);
        copy.removeAll(this);
        return super.addAll(copy);
    }

    @Override
    public boolean addAll(int index, Collection<? extends E> collection) {
        Collection<E> copy = new LinkedList<>(collection);
        copy.removeAll(this);
        return super.addAll(index, copy);
    }

    @Override
    public void add(int index, E element) {
        if (!contains(element)) {
            super.add(index, element);
        }
    }
}   
