## 안드로이드 부팅시 서비스(Service) 실행하기

### 이슈
- 디바이스가 재부팅 되었을 때, 지정해둔 시간에도 notification 알람이 울리지 않음.
- 디바이스가 재부팅 되었을 때에도 기능이 실행되어야 함.

### 목적
- 디바이스가 재부팅된 후에도, DB를 조회해서 알람을 다시 등록할 수 있도록 한다.
<hr>

## 1. 부팅시기 알람 받기
부팅이 되었을 때, 앱이 안드로이드로부터 알림을 받아야 한다. 이를 위해서는 **Receiver**가 필요하다.

Receiver를 작성하기 전에, 먼저 **권한**을 추가해줘야 한다.
**manifest.xml** 에 ```android.permission.RECEIVE_BOOT_COMPLETED``` 권한을 추가해준다. 

## 2. Receiver 추가하기
RebootReceiver를 생성한 후에, AndroidManifest.xml에 해당 receiver에, intent-filter를 추가해준다.
BOOT_COMPLETED라는 부팅이 완료됐을 때, 보내주는 intent를 받기 위함이다.

## 3. Service 작성
startForeground를 작성해준다.
Android로부터 메시지를 받은 Receiver가 실행시킨 Service가 onHandleIntent를 실행시켜 준다.
알람 앱이므로, DB를 조회해서 다시 세팅해주는 역할을 이 부분에서 해준다.


## 정리
- BOOT_COMPLETED라는 메시지를 안드로이드 시스템에서 receiver를 통해서 받고, Service를 실행시킨다.
- 디바이스를 재부팅하고 잠금암호가 걸려있다면, 잠금암호를 해제시켰을 때 실행되는 것이다.
- 해제 이후에 약간의 시간차가 있을 수 있으니 테스팅을 통해 명확한 시점을 파악해야 한다.
