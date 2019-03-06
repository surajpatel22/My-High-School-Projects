
public class BinaryTree {

	private BTNode root;
	
	public BinaryTree() {}
	
	public BinaryTree(int v) {
		root = new BTNode(v);
	}
	
	public void add(int v) {
		if (root == null) root = new BTNode(v);
		else addR(root, v);
	}
	
	private void addR(BTNode root, int v) {
		if (v > root.getValue()) {
			if (root.getRight() == null) root.setRight(new BTNode(v));
			else addR(root.getRight(), v);
		}else {
			if (root.getLeft() == null) root.setLeft(new BTNode(v));
			else addR(root.getLeft(), v);
		}
	}
	
	private String strR(BTNode node) {
		String str = "";
		if (node == null) return "";
		str += strR(node.getLeft());
		str += node.getValue() + " ";
		str += strR(node.getRight());
		return str;
	}
	
	
	public String toString() {
		return "Binary Tree: " + strR(root);
	}

}
