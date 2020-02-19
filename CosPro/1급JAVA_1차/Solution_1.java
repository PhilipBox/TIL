package CosPro1급1차;
// You may use import as below.
//import java.util.*;


public class Solution_1 {
    public long solution(long num) {
        // Write code here.
    	
    	num++;
    	String str = Long.toString(num);
    	String str2 = "";
    	for(int i=0; i<str.length(); i++) {
    		if(str.charAt(i)=='0') {
    			str2+= "1";
    		}
    		else {
    			str2+=str.charAt(i)+"";
    		}
    	}
    	
    	
        long answer = Long.parseLong(str2);
        return answer;
    }

    // The following is main method to output testcase.
    public static void main(String[] args) {
        Solution_1 sol = new Solution_1();
        long num = 9949999;
        long ret = sol.solution(num);

        // Press Run button to receive output. 
        System.out.println("Solution: return value of the method is " + ret + " .");
    }
}