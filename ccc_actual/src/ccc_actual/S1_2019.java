package ccc_actual;
import java.util.*;

public class S1_2019 {
	
	public static void main(String []args) {
		Scanner s = new Scanner(System.in);
		String input = s.nextLine();
		int v = 0;
		int h = 0;
		for (int i = 0; i < input.length(); i++) {
			if (input.charAt(i) == 'V') {
				v += 1;
			}else {
				h += 1;
			}
		}
		
		if (v % 2 == 0) {
			if (h % 2 == 0) {
				System.out.println(1 + " " + 2);
				System.out.println(3 + " " + 4);
			}else {
				System.out.println(3 + " " + 4);
				System.out.println(1 + " " + 2);
			}
		}else {
			if (h % 2 == 0) {
				System.out.println(2 + " " + 1);
				System.out.println(4 + " " + 3);
			}else {
				System.out.println(4 + " " + 3);
				System.out.println(2 + " " + 1);
			}
		}
		
		
	}
	
	
	
	
}
