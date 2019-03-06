import java.util.*;

public class ArrayListLesson{
	
	private static ArrayList<Employee> emparr = new ArrayList<Employee>();
	
	
	public static void main(String[] args) {
		
		emparr.add(new Employee("Bavid", "Deckham", 101, 30000));
		emparr.add(new Employee("Bobe", "Kryant", 102, 35000));
		emparr.add(new Employee("Gill", "Bates", 103, 40000));
		
		System.out.println(emparr.get(0).get_firstName());
		System.out.println(emparr.get(2).get_employeeID());
	}
	
}




/*
 * 
 * ArrayList<object> name = new ArrayList<object>();
 * 
 * name.add(object)
 * name.get(index);
 * name.remove(index);
 * name.size();
 * 
 * 
 * 
 * private = only this file      (encapsulated = private)
 * protected = also subclasses
 * public = everyone
 * 
 * constructor = public className(---, ---){
 *                      ~~~ = ---
 *                      ~~~ = ---
 *                }
 *                 
 * import = - - - - >
 *                   .
 * inherit = ________|\
 *                   |/
 *                   '
 *                   
 * "static" = "class"   ("class variables")
 * "non-static" = "object" = "instance"
 */


/*

import java.util.*;
 
public class name extends name2{     //inherits
	
	Scanner input = new Scanner(System.in);    //scanner
	boolean bool = input.nextBoolean();
	
	
	
	
	
}

private int x(int y, boolean z) {
	sijsnjsnk
}
									//method overloading
private int x(double y, int z) {
	sjknlssl
}




//inside the superclass:
public int a(int x, int y) {
	
}

//inside the subclass:
public int a(int x) {
							//method overriding
}





//inside a subclass:
public subclass(int a, double b, String c) {
	super(a,b);  //superclass object instantiated first  
	CCC = c;											//subclass constructor
}


*/

