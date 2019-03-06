package ccc_practice;
import java.util.*;

public class S1_2017 {

	public static void main(String[] args) {
		
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		s.nextLine();
		String[] team1 = s.nextLine().split(" ");
		String[] team2 = s.nextLine().split(" ");
				
		int k = 0;
		int runs1 = 0;
		int runs2 = 0;
			
		for (int i = 0; i < team1.length; i++) {
			runs1 += Integer.parseInt(team1[i]);
			runs2 += Integer.parseInt(team2[i]);
			if (runs1 == runs2) {
				k = i+1;
			}	
		}
		System.out.println(k);
	}

}
