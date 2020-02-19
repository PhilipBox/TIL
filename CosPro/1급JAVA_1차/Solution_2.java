package CosPro1급1차;

class Solution_2 {

	// 우, 하, 좌, 상
	static int[] dr = { 0, 1, 0, -1 };
	static int[] dc = { 1, 0, -1, 0 };

	// 배열범위 내부라면 return true
	// 그렇지 않다면 return false
	static boolean isRange(int r, int c, int n) {
		return r >= 0 && c >= 0 && r < n && c < n;
	}

	public int solution(int num) {
		// Write code here.
		int[][] map = new int[num][num];

		int r = 0;
		int c = 0;
		int cnt = 1;

		// 다음칸이 배열범위 이내이고, 0이어야 함.
		while (isRange(r, c, num) && map[r][c] == 0) {
			for (int i = 0; i < 4; i++) {
				//배열범위 바깥이거나, 0이 아니라면(이미 갔던 곳이라면)
				if (!isRange(r, c, num) || map[r][c] != 0)
					break;
				while (true) {
					map[r][c]=cnt++;
					int nr = r + dr[i];
					int nc = c + dc[i];
					if(!isRange(nr,nc,num) || map[nr][nc]!=0) {
						r += dr[(i+1)%4];
						c += dc[(i+1)%4];
						break;
					}
					r = nr;
					c = nc;
				}
			}
		}
		int answer = 0;
		for(int i=0; i<num; i++) {
			answer += map[i][i];
		}
		return answer;
	}

	// The following is main method to output testcase.
	public static void main(String[] args) {
		Solution_2 sol = new Solution_2();
		int n1 = 3;
		int ret1 = sol.solution(n1);

		// Press Run button to receive output.
		System.out.println("Solution: return value of the method is " + ret1 + " .");

		int n2 = 2;
		int ret2 = sol.solution(n2);

		// Press Run button to receive output.
		System.out.println("Solution: return value of the method is " + ret2 + " .");
	}
}