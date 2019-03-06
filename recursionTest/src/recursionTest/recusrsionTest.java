package recursionTest;

public class recusrsionTest {
		
	public static void hailstone(int i) {
		System.out.print(i + " ");
		if (i != 1) {
			if (i % 2 == 0) {
				hailstone(i / 2);
			} else {
				hailstone(3*i + 1);
			}
		}
	}
	
	public static int count1(int i) {
		if (i == 0) { return 0; }
		if (i >= 10){
			if (i % 100 == 91) { return count1(i / 100); }
			if (i % 100 == 51) { return 2 + count1(i / 100); }
			if (i % 100 == 31) { return 3 + count1(i / 100); }
		}
		if (i % 10 == 1) { return 1 + count1(i / 10); }
		
		return count1(i / 10);
	}
	
	
	
	
	
	
	public static void main(String[] args) {

		System.out.println(827370449*3 +1);
		
	}
	

}
