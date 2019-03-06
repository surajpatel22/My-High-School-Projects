package ccc_actual;
import java.util.ArrayList;
import java.util.Scanner;

public class S2_2019 {
	
	public static ArrayList<Integer> primes = new ArrayList<Integer>();
	public static ArrayList<Integer> notprimes = new ArrayList<Integer>();
	
	public static void main(String []args) {
		Scanner s = new Scanner(System.in);
		int amount = s.nextInt();
		
		primes.add(2);
		String out = "";
		
		for (int i = 0; i < amount; i++) {
			
			int n = s.nextInt();
			for (int j = 0; ; j++) {
				if (primes.contains(n+j) && primes.contains(n-j)) {
					 out += ( (n+j) + " " + (n-j) + "\n");
					 break;
				} else if (notprimes.contains(n-j) || notprimes.contains(n+j)) {
					continue;
				}else if (isPrime(n-j) && isPrime(n+j)) {
					 out += ( (n+j) + " " + (n-j) + "\n");
					 break;
				}
			}
		
		}
		System.out.print(out);
		
	}
	
	public static boolean isPrime(int p) {
		for (int i = 2; i < p; i++) {
			if (p % i == 0) {
				notprimes.add(p);
				return false;
			}
		}
		primes.add(p);
		return true;
	}
	
	
	
	
}
