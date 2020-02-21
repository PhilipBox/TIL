package KBdata;

import java.util.Scanner;

public class Solution4 {
	static int ANS=0;
	public static void main(String[] args) throws Exception {
		Scanner sc = new Scanner(System.in);
		int N = sc.nextInt();
		tower(N,1,3);
		System.out.println(ANS);		
	}
	
	static void tower(int height, int current, int next){
		if(height==1){
			ANS++;
			return;
		}
		
		tower(height-1, current, 6-current-next);
		tower(1, current, next);
		tower(height-1, 6-current-next, next);
	}
	
}
