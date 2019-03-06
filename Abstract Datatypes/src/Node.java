
public class Node {
	private int value;
	private Node next;
	
	public Node() {}
	public Node(int v, Node n) {
		next = n;
		value = v;
	}
	
	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public Node getNext() {
		return next;
	}

	public void setNext(Node next) {
		this.next = next;
	}

}
