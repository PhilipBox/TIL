### Thread 
 - UI�۾��� �׻� `Main Thread`���� �� �Ͼ�� �Ѵ�!<br>
 - `Main Thread`�� ������, �ٸ� worker thread�� �۾��� ������ �ʾҴٸ�, Process�� ������� �ʴ´�.<br>

***
### Thread ���� ��� 2����
***
## `extends Thread` class
 override its `run()` method.<br>
## `implement Runnable` interface
���� �� ��� ���, `start()` method�� �����Ѵ�.

***
## Two simple Rules in using Threads
1. Do not block the UI thread.<br>
2. Do not access the Android UI toolkit from outside the UI thraed.<br>