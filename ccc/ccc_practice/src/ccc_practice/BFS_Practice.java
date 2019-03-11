package ccc_practice;
import java.util.*;

public class BFS_Practice {

	public static void main(String[] args) {
		ArrayList<ArrayList<Integer>> graph = new ArrayList<ArrayList<Integer>>();
		for (int i = 0; i <= 9; i++) {
			graph.add(new ArrayList<Integer>());
		}
		graph.get(1).add(2);
		graph.get(1).add(6);
		graph.get(1).add(8);
		graph.get(2).add(1);
		graph.get(2).add(3);
		graph.get(3).add(2);
		graph.get(3).add(4);
		graph.get(3).add(8);
		graph.get(3).add(9);
		graph.get(4).add(3);
		graph.get(4).add(5);
		graph.get(5).add(4);
		graph.get(5).add(7);
		graph.get(5).add(9);
		graph.get(6).add(1);
		graph.get(6).add(7);
		graph.get(7).add(5);
		graph.get(7).add(6);
		graph.get(7).add(9);
		graph.get(8).add(1);
		graph.get(8).add(3);
		graph.get(9).add(3);
		graph.get(9).add(5);
		graph.get(9).add(7);
		
		ArrayList<ArrayList<Integer>> levels = new ArrayList<ArrayList<Integer>>();
		ArrayList<Integer> visited = new ArrayList<Integer>();
		
		levels.add(new ArrayList<Integer>());
		levels.get(0).add(1);
		visited.add(1);
		System.out.println(1);
		
		for (int l = 0; l < levels.size(); l++) {
			System.out.println("");
			for (int i = 0; i < levels.get(l).size(); i++) {
				
				for (int j = 0; j < graph.get(levels.get(l).get(i)).size(); j++) {
					
					if (visited.contains(graph.get(levels.get(l).get(i)).get(j))) {
						continue;
					}
					visited.add(graph.get(levels.get(l).get(i)).get(j));
					System.out.println(graph.get(levels.get(l).get(i)).get(j));
					if (levels.size() <= l + 1) levels.add(new ArrayList<Integer>());
					levels.get(l+1).add(graph.get(levels.get(l).get(i)).get(j));
				}
				
			}
			
		}
		
	}

}
