
public class EmployeeTest {

	public static void main(String[] args) {
		CommissionEmployee employee1 = new CommissionEmployee("Mark", "Ville", 101, 40000);
		System.out.println(employee1.get_employeeID() + " has earned: " + employee1.netSalary());
		employee1.set_salary(10000);
		System.out.println(employee1.get_employeeID() + " has earned: " + employee1.netSalary());
	}
}