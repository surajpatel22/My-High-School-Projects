public class CommissionEmployee extends BaseCommissionEmployee {
// Fields
// Methods
	public void set_salary(double new_salary) {
		salary = 0;
	}

// Constructor Method
	public CommissionEmployee(String f, String l, int e, double sls) {
		super(f, l, e, 0, sls);
	}
}