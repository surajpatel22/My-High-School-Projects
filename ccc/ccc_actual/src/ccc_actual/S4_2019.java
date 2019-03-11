package ccc_actual;
import java.util.*;

public class S4_2019 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int[] attractions = new int[s.nextInt()];
		int k = s.nextInt();
		
		//possibly put them in already sorted
		for (int i = 0; i < attractions.length; i++) {
			attractions[i] = s.nextInt();
		}
		Arrays.sort(attractions);
		
		int sum = 0;
		int upper = attractions.length - 1;
		int lower = 0;
		
		while(upper - lower >= k) {
			sum += attractions[upper];
			upper -= 1;
			lower += k - 1;
		}
		sum += attractions[upper];
		System.out.print(sum);
		
		

	}

}
