package CosPro1급_2차;
// 다음과 같이 import를 사용할 수 있습니다.
import java.util.*;

class Solution_4 {
    public int solution(int[] arr, int K) {
    	int len = arr.length;
    	int cnt=0;
    	for(int i=0; i<len; i++) {
    		for(int j=i+1; j<len; j++) {
    			for(int k=j+1; k<len; k++) {
    				if( (arr[i]+arr[j]+arr[k])%K==0)
    					cnt++;
    			}
    		}
    	}
        int answer = cnt;
        return answer;
    }

    // 아래는 테스트케이스 출력을 해보기 위한 main 메소드입니다.
    public static void main(String[] args) {
        Solution_4 sol = new Solution_4();
        int[] arr = {1, 2, 3, 4, 5};
        int K = 3;
        int ret = sol.solution(arr, K);


        // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
        System.out.println("solution 메소드의 반환 값은 " + ret + " 입니다.");
    }
}