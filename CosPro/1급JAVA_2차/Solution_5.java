package CosPro1급2차;

// 다음과 같이 import를 사용할 수 있습니다.
import java.util.*;

class Solution_5 {
	public int solution(int[] arr) {

		int max = 0;
		int cnt = 1;
		for (int i = 0; i < arr.length; i++) {
			int start = arr[i];
			cnt=1;
			for (int j = i + 1; j < arr.length; j++) {
				
				if(start>arr[j])
					break;
				else if(start==arr[j])
					continue;
				else {
					cnt++;
					start=arr[j];
				}
			}
			max = Math.max(max, cnt);
		}
		int answer = max;
		return answer;
	}

	// 아래는 테스트케이스 출력을 해보기 위한 main 메소드입니다.
	public static void main(String[] args) {
		Solution_5 sol = new Solution_5();
		int[] arr = { 3, 1, 2, 4, 5, 1, 2, 2, 3, 4 };
		int ret = sol.solution(arr);

		// [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
		System.out.println("solution 메소드의 반환 값은 " + ret + " 입니다.");
	}
}