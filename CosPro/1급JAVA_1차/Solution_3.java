package CosPro1급1차;
// You may use import as below.


class Solution_3 {
	static int dr[] = { -1, -2, -2, -1, 1, 2, 2, 1 };
	static int dc[] = { -2, -1, 1, 2, 2, 1, -1, -2 };
	
	public int solution(String pos) {
		int answer = 0;
		
		int r = 8-(pos.charAt(1)-'0');
		int c = pos.charAt(0)-'A';
		for(int i=0; i<8; i++) {
			int nr = r + dr[i];
			int nc = c + dc[i];
			if(nr < 0 || nc <0 || nr >= 8 || nc >= 8) continue;
			answer++;
		}
		return answer;
	}

	// The following is main method to output testcase.
	public static void main(String[] args) {
		Solution_3 sol = new Solution_3();
		String pos = "A7";
		int ret = sol.solution(pos);

		// Press Run button to receive output.
		System.out.println("Solution: return value of the method is " + ret + " .");
	}
}