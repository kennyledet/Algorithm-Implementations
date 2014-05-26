
import java.util.Iterator;
import java.util.NoSuchElementException;

public class Queue<Item> implements Iterable<Item> {
    private Node<Item> first;   
    private Node<Item> last;  
    private int N;          

    private class Node<Item> {
        private Item item;
        private Node<Item> next;
    }

    public Queue() {
        first = null;
        last = null;
        N = 0;
    }

    public boolean isEmpty() { return N == 0; }
    public int     size()    { return N; }

    public void enqueue(Item item) {
        Node<Item> oldLast = last;
        last = new Node<Item>();
        last.item = item;
        last.next = null;

        if   (isEmpty()) first = last;
        else             oldLast.next = last;
        N++;
    }

    public Item dequeue() {
        if (isEmpty()) throw new NoSuchElementException("Queue underflow");
        Item item = first.item;
        first = first.next;
        N--;

        if (isEmpty()) last = null;
        return item;
    }

    public Iterator<Item> iterator()
    { return new QueueIterator<Item>(first); }

    private class QueueIterator<Item> implements Iterator<Item> {
        private Node<Item> current;

        public QueueIterator(Node<Item> first) {
            current = first;
        }

        public boolean hasNext() { return current != null; }
        public void    remove()  { throw new UnsupportedOperationException(); }

        public Item next() {
            if (!hasNext()) throw new NoSuchElementException();
            Item item = current.item;
            current = current.next;
            return item;
        }
    }
}
