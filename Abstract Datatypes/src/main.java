
public class main {


	public static void main(String[] args) {
		
		/*LinkedList ll = new LinkedList(8);
		ll.add(16);
		ll.add(5);
		ll.remove(3);
		
		Queue q = new Queue();
		
		q.queue(5);
		q.queue(7);
		q.queue(-3);

		System.out.println(q);
		
		q.dequeue();
		System.out.println(q);
		q.dequeue();
		System.out.println(q);
		q.dequeue();
		System.out.println(q);
		q.dequeue();
		System.out.println(q);
		q.dequeue();
		System.out.println(q);
		q.dequeue();
		System.out.println(q);

		*/
		Stack s = new Stack(1);
		s.push(2);
		s.push(3);
		s.push(4);
		s.pop();
		s.pop();		
		s.pop();
		
		
		/*Node n4 = new Node(10, n3);
		
		Node n5 = new Node(3, n4);
		
		Node n6 = new Node(20, n4);
		Node n7 = new Node(40, n6);
		Node n8 = new Node(13, n7); */
		
		System.out.println(s);

		BinaryTree bt = new BinaryTree();
		

		
		
		Node x = new Node();
		
		System.out.println(x.getNext());
		System.out.println(bt);
		
	
	}

}
