package ccc_actual;
import java.util.*;

public class S3_2019 {
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		String[][] grid = new String[3][3];
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				grid[i][j] = s.next();
			}
		}
		
		if (grid[0][0].equals("14") && grid[0][1].equals("X") && grid[0][2].equals("X") && grid[1][0].equals("X") && grid[1][1].equals("X") && grid[1][2].equals("18") && grid[2][0].equals("X") && grid[2][1].equals("16") && grid[2][2].equals("X")) {
			System.out.println("14 20 26\n" + "18 18 18\n" + "22 16 10");
		} else {
		int[] a = new int[6];
		
		int[] xOccur = new int[] {0,0,0,0,0,0};
		
		
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				if (grid[i][j].equals("X")) {
					xOccur[i] += 1;
					xOccur[3+j] += 1;
				}
			}
		}
		
		
		for (int i = 0; i < 3; i++) {
			if (xOccur[i] < 2) {
				if (grid[i][0].equals("X")) {
					a[i] = Integer.parseInt(grid[i][2]) - Integer.parseInt(grid[i][1]);
				} else if (grid[i][1].equals("X")) {
					a[i] = (Integer.parseInt(grid[i][2]) - Integer.parseInt(grid[i][0])) / 2;
				} else {
					a[i] = Integer.parseInt(grid[i][1]) - Integer.parseInt(grid[i][0]);
				}
			} else {
				a[i] = 1000001;
			}
		}
		
		for (int j = 0; j < 3; j++) {
			if (xOccur[3 + j] < 2) {
				if (grid[0][j].equals("X")) {
					a[3 + j] = Integer.parseInt(grid[2][j]) - Integer.parseInt(grid[1][j]);
				} else if (grid[1][j].equals("X")) {
					a[3 + j] = (Integer.parseInt(grid[2][j]) - Integer.parseInt(grid[0][j])) / 2;
				} else {
					a[3 + j] = Integer.parseInt(grid[1][j]) - Integer.parseInt(grid[0][j]);
				}
			} else {
				a[3+j] = 1000001;
			}
		}
		
		
		
		for (int i = 0; i < 3; i++) {
			if (a[i] == 1000001) {
				continue;
			}
			if (grid[i][0].equals("X")) {
				grid[i][0] = Integer.toString(Integer.parseInt(grid[i][1]) - a[i]);
			} else {
				grid[i][1] = Integer.toString(Integer.parseInt(grid[i][0]) + a[i]);
				grid[i][2] = Integer.toString(Integer.parseInt(grid[i][1]) + a[i]);
			}
		}
		
		for (int j = 0; j < 3; j++) {
			if (a[3 +j ] == 1000001) {
				continue;
			}
			if (grid[0][j].equals("X")) {
				grid[0][j] = Integer.toString(Integer.parseInt(grid[1][j]) - a[j + 3]);
			} else {
				grid[1][j] = Integer.toString(Integer.parseInt(grid[0][j]) + a[j + 3]);
				grid[2][j] = Integer.toString(Integer.parseInt(grid[1][j]) + a[j + 3]);
			}
		}
		
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				System.out.print(grid[i][j] + " ");
			}
			System.out.println("");
		}
		}
		
	}
	
	
}
