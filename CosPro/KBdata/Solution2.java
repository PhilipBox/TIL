package KBdata;

import java.util.Scanner;

public class Solution2 {
	public static void main(String[] args) throws Exception {
		Scanner sc = new Scanner(System.in);
		int M = sc.nextInt();
		int N = sc.nextInt();

		int min = (int) Math.ceil(Math.sqrt(M));
		int sum = 0;
		for (int i = min; i <= Math.floor(Math.sqrt(N)); i++) {
			sum += Math.pow(i, 2);
		}
		System.out.println((int) Math.pow(min, 2) + " " + sum);
	}
}
