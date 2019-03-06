
public class Queue {

	private Node head = null;
	private Node tail = null;
	private int counter = 1;

	public void queue(int i) {
		if (counter == 0) {
			head = new Node(i, null);
			tail = head;
		}else {
			tail = new Node(i, tail);
		}
		counter++;
	}
	
	public void dequeue() {
		if (counter == 0) { return; }
		if (counter == 1) {
			head = null;
			tail = null;
		} else {
			Node n = tail;
			for (int i = 0; i < counter - 2; ++i) {
				n = n.getNext();
			}
			n.setNext(null);
			head = n;
		}
		counter--;
	}
	
	public String toString() {
		String out = "Queue: [";
		Node n = tail;
		while(n != null) {
			out += n.getValue() + ", ";
			n = n.getNext();
		}
		return out.substring(0,out.length() - ((out.length()==8)? 0 : 2)) + "]";
	}

}
