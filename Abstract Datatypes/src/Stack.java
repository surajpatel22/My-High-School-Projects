
public class Stack {

	private Node top;
	private int counter = 0;
	
	public Stack() {}
	
	public Stack(int n) {
		push(n);
	}
	
	public void push(int n) {
		top = new Node(n, top);
		counter++;
	}
	
	public int pop() {
		if (counter == 0) { return 0; }
		Node temp = top;
		top = temp.getNext();
		counter--;
		return temp.getValue();
		
	}
	
	public String toString() {
		Node temp = top;
		String out = "Stack:";
		while(temp != null) {
			out += " " + temp.getValue();
			temp = temp.getNext();
		}
		return out;
	}

}
