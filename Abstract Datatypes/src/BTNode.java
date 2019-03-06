
public class BTNode {
	private int value;
	private BTNode left;
	private BTNode right;

	
	public BTNode(int v) {
		value = v;
	}
	
	public int getValue() {
		return value;
	}


	public BTNode getLeft() {
		return left;
	}



	public void setLeft(BTNode left) {
		this.left = left;
	}



	public BTNode getRight() {
		return right;
	}



	public void setRight(BTNode right) {
		this.right = right;
	}


}
