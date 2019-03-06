
public class LinkedList {
	
	private Node head;
	private Node tail;
	
	public LinkedList(int value) {
		head = new Node(value, null);
		tail = head;
	}
	
	public void add(int value) {
		Node newNode = new Node(value, null);
		tail.setNext(newNode);
		tail = newNode;
	}
	
	public void remove(int pos){
		if (head == null) {
			return;
		}
		if (pos == 0) {
			head = head.getNext();
			return;
		}
		Node tempNode = getNode(pos-1);
		tempNode.setNext(tempNode.getNext().getNext());
	}
	
	public void clear() {
		tail = null;
		head = null;
	}
	
	public Node getNode(int n) {
		Node tempNode = head;
		for (int i = 0; i < n; ++i) {
			if (tempNode.getNext() == null) {
				return null;
			}
			tempNode = tempNode.getNext();
		}
		return tempNode;
	}
	
	public int getVal(int n) {
		Node tempNode = head;
		for (int i = 0; i < n; ++i) {
			tempNode = tempNode.getNext();
		}
		
		return tempNode.getValue();
	}
	
	public String toString() {
		String out = "[" + head.getValue();
		Node tempNode = head.getNext();
		while (tempNode != null) {
			out += ", ";
			out += tempNode.getValue();
			tempNode = tempNode.getNext();
		}
		return out + "]";
	}
	
	
}
