### Thread 
 - UI작업은 항상 `Main Thread`에서 만 일어나야 한다!<br>
 - `Main Thread`가 끝나도, 다른 worker thread의 작업이 끝나지 않았다면, Process는 종료되지 않는다.<br>

***
### Thread 생성 방법 2가지
***
## `extends Thread` class
 override its `run()` method.<br>
## `implement Runnable` interface
위의 두 방법 모두, `start()` method로 시작한다.

***
## Two simple Rules in using Threads
1. Do not block the UI thread.<br>
2. Do not access the Android UI toolkit from outside the UI thraed.<br>