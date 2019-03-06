package ccc_practice;
import java.util.*;

public class S2_2017 {

	public static void main(String[] args) {
		
		Scanner s = new Scanner(System.in);
		int[] arr = new int[s.nextInt()];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = s.nextInt();
		}
		Arrays.sort(arr);
		for (int i = 0; i < arr.length / 2; i++) {
			if (arr.length % 2 == 0) { System.out.print(arr[arr.length / 2 - i - 1] + " " + arr[arr.length / 2 + i] + " "); }
			else { System.out.print(arr[arr.length / 2 - i] + " " + arr[arr.length / 2 + 1 + i] + " "); }
		}
		if (arr.length % 2 == 1) System.out.print(arr[0]);
	}

}
