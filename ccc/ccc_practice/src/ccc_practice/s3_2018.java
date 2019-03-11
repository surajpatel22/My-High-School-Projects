package ccc_practice;
import java.util.*;

public class s3_2018 {
	
	public static Scanner s = new Scanner(System.in);
	
	public static String[][] grid = new String[s.nextInt()][s.nextInt()];


	public static void main(String[] args) {
		
		s.nextLine();
		
		for (int i = 0; i < grid.length; i++) {
			grid[i] = s.nextLine().split("");
		}
		
		int tempDistance = 0;
		for (int i = 0; i < grid.length; i++) {
			for (int j = 0; j < grid[0].length; j++){
				if (grid[i][j].equals(".")) {
										
					for (int a = 0; a < visited.length; a++) {
						for (int b = 0; b < visited[0].length; b++) {
							visited[a][b] = 0;
						}
					}
					visited[i][j] = 1;
					
					tempDistance = distance(i,j);	
					if (tempDistance < 100000) {
							System.out.println(tempDistance);
					} else {
						System.out.println(-1);
					}
				}
			}
		}
		
		
		

	}
	
	public static int[][] visited = new int[grid.length][grid[0].length];
	
	public static int distance(int i, int j) {
		int[] arr = new int[] {100000, 100000, 100000, 100000};

		if (!grid[i-1][j].equals("W")) {
			if (grid[i-1][j].equals("S")) return 1;
			if (visited[i-1][j] != 1) {
				visited[i-1][j] = 1;
				arr[0] = 1 + distance(i-1, j);
			}
		}
		if (!grid[i][j-1].equals("W")) {
			if (grid[i][j-1].equals("S")) return 1;
			if (visited[i][j-1] != 1) {
				visited[i][j-1] = 1;
				arr[1] = 1 + distance(i, j-1);
			}
		}
		if (!grid[i+1][j].equals("W")) {
			if (grid[i+1][j].equals("S")) return 1;
			if (visited[i+1][j] != 1) {
				visited[i+1][j] = 1;
				arr[2] = 1 + distance(i+1, j);
			}
		}
		if (!grid[i][j+1].equals("W")) {
			if (grid[i][j+1].equals("S")) return 1;
			if (visited[i][j+1] != 1) {
				visited[i][j+1] = 1;
				arr[3] = 1 + distance(i, j+1);
			}		
		}
		Arrays.sort(arr);
		return arr[0];
	}

}





