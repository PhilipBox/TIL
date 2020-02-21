package KBdata;

import java.util.Scanner;

public class Solution1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int N = sc.nextInt();
		int[] arr = new int[N];
		int ans = 1000000;
		for(int i=0; i<N; i++) {
			arr[i] = sc.nextInt();
			if(i!=0) {
				ans = Math.min(ans, arr[i]-arr[i-1]);
			}
		}
		System.out.println(ans);
	}
}
