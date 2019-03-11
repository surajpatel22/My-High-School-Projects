package main;
import java.util.*;

class Node{
	public Node(int value, int weight) {
		v = value;
		w = weight;
	}
	public int v;
	public int w;
}

public class Main {
	
	public static void main(String []args) {
		Node n = new Node(1, 2); 
		n.w = 7;
		System.out.println(n.v + ", " + n.w);
	}
	
}





  