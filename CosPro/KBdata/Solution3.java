package KBdata;

import java.util.Scanner;

public class Solution3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		double GoalH = sc.nextDouble(), U = sc.nextDouble(), D = sc.nextDouble(), F = sc.nextDouble();
		F /= 100;
		int day = 1;
		double diff = U * F;
		double currentH = 0;
		boolean success = true;
		while (true) {
			currentH += U;
			if (currentH > GoalH)
				break;
			currentH -= D;
			if (currentH < 0) {
				success = false;
				break;
			}
			day++;
			U -= diff;
		}
		if (success)
			System.out.println("Success " + day);
		else
			System.out.println("Failure " + day);
	}
}
