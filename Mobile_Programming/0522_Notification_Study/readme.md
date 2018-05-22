## Schedule repeating alarms

알람(`AlarmManager`클래스를 기반으로 함)을 사용하면 나의 App Lifetime 이외의 시간 기반의 작업을 수행 할 수 있다.<br>
 예를 들어, 너는 하루에 한 번 일기예보를 다운받기 위해 service를 시작하는 것 처럼, 장기 실행 작업을 시작하기 위해 알람을 사용할 수 있다.<br><br>

알람에는 다음과 같은 특징이 있다.<br><br>

- 설정된 시간과 또는, 간격으로 `Intent`를 발생시킬 수 있다.
- `broadcast receiver`와 함께 사용하면 서비스를 시작하고 다른 작업을 수행 할 수 있다.
- Application 외부에서 작동하므로, Application이 실행되고 있지 않거나 device 자체가 sleep상태인 경우에도 Application을 사용하여 event나 action을 발생시킬 수 있다.
- Application의 resource requirement를 최소화하는 데 도움이 된다. 또한, timers나 지속적으로 실행되는 background service에 의존하지 않고도 작업을 예약할 수 있다.<br>

```
앱이 살아있는 동안 작동될 것이 확실한 타이밍 작업의 경우,
Timer와 Thread와 함께 Handler 클래스를 사용하는 것을 추천한다.
이 방법은 안드로이드에서 시스템 리소스 제어를 더욱 잘 할 수 있도록 한다.
```

### Decide how precise your alarm needs to be
위에 기재한 바와 같이, 알람을 생성할 때 가장 첫 단계는 주로 알람 타입을 결정하는 것이다. 다음 단계는 알람이 얼마나 정확해야 하는지 결정하는 것이다. 대부분의 앱들에는 `setInexactRepeating()`가 적합하다.<br>
 이 메소드를 사용하면 안드로이드는 여러개의 부정확한 반복 알람들을 동기화하여 동시에 작동시킨다. 이를통해 배터리 소모를 줄일 수 있게된다.<br><br>
정확한 시간이 요구되는 앱들의 경우는??`예를 들어, 정확히 오전 8:30 부터 시작하여 그 후 매 정시에 작동되어야 하는 알람` 은 `setRepeating()`을 사용한다. 하지만 정밀한 알람은 리소스에 영향을 미칠수 있으니 사용하지 않는것이 좋다.<br><br>
`setInexactRepeating()`에서는 `setRepeating()`와 같이 커스텀 인터벌을 지정할 수 없다. `INTERVAL_FIFTEEN_MINUTES`, `INTERVAL_DAY` 등의 인터벌 상수를 사용해야만 한다. 전체 목록을 보려면 AlarmManager를 참조한다.<br>


### Cancle an Alarm
앱에 따라 알람 취소하는 기능을 추가하고 싶을 수 있을 것이다. 알람을 취소하기 위해서는, Alarm Manager 에서 cancel() 을 호출함으로써 더이상 작동을 원하지 않는 PendingIntent 을 전달한다.<br><br>
```
// If the alarm has been set, cancel it.
if (alarmMgr!= null) {
alarmMgr.cancel(alarmIntent);
}
```


### Start an Alarm When the Device Boots
 기본적으로 디바이스를 종료하면 모든 알람은 취소된다. 이러한 상황이 벌어지는 것을 막기 위해, 유저가 디바이스를 재부팅했을 때, 앱이 자동적으로 알람을 재구동 하도록 설계할 수 있다. 이것은 `AlarmManager`가 유저의 수동적 알람 재구동 없이 지속적으로 작업을 할 수 있도록 해준다.<br>
설계 단계는 다음과 같다.<br><br>
### 1. 앱 Manifest에 `RECEIVE_BOOT_COMPLETED` 권한을 설정한다.
 이 액션은 시스템 부팅 완료 후 broadcast인 `ACTION_BOOT_COMPLETED`를 받을 수 있도록 해준다.<br>
(유저가 앱을 적어도 한 번 이상 실행했을 경우에만 적용)<br><br>

```
<uses-permission android:name=”android.permission.RECEIVE_BOOT_COMPLETED”/>
```

### 2. BroadCast를 전달받을 수 있도록 `BoradcastReceiver`를 적용한다.<br>
```public class SampleBootReceiver extends BroadcastReceiver {
	@Override
	public void onReceive(Context context, Intent intent) {
	if (intent.getAction().equals(“android.intent.action.BOOT_COMPLETED”)) {
	// Set the alarm here.
   }
  }
}
```
### 3. 인텐트 필터로 `ACTION_BOOT_COMPLETED` 액션을 Manifest에 등록한다.<br>
```
<receiver android:name=”.SampleBootReceiver”
android:enabled=”false”>
<intent-filter>
<action android:name=”android.intent.action.BOOT_COMPLETED”></action>
</intent-filter>
</receiver>
```
매니페스트에서는 부트 리시버가 android:enabled=”false” 로 셋팅되어 있는 것을 알 수 있다. 그것은 앱이 명시적으로 사용되도록 설정하지 않는 이상 리시버가 호출되지 않음을 뜻한다. 이것은 부트 리시버가 불필요하게 호출되는 것을 막는다. 다음 방법으로 리시버를 활성화 할 수 있다 (예를 들어, 유저가 알람을 셋팅할 때)<br>
```
ComponentName receiver = new ComponentName(context, SampleBootReceiver.class);
PackageManager pm = context.getPackageManager();
pm.setComponentEnabledSetting(receiver,
PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
PackageManager.DONT_KILL_APP);
```
만약 리시버를 이와 같은 방법으로 활성화하면, 유저가 디바이스를 재부팅 하여도 활성화 된 상태가 유지될 수 있다. 즉, 프로그래밍 방식으로 리시버를 활성화하는 것은 재부팅 등의 상황에서도 매니페스트 셋팅을 덮을 수 있다는 것이다. 앱이 비활성화 시킬 때까지 리시버는 활성화 된 상태일 것이다. 다음과 같은 방법으로 리시버를 비활성화 시킬 수 있다 (예를 들어, 유저가 알람을 취소할 때)<br><br>
```
ComponentName receiver = new ComponentName(context, SampleBootReceiver.class);
PackageManager pm = context.getPackageManager();
pm.setComponentEnabledSetting(receiver,
PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
PackageManager.DONT_KILL_APP)
```

<br>AlarmManager 의 set 과 setRepeating 메서드를 사용하고 있는 경우라면, API 19 부터는 이벤트가 발생하는 간격이 정확히 일치하지 않을 수 있다는 점을 염두해 두어야 한다. 이전과 같이 앱이 비교적 정확한 시간 마다 발생하는 이벤트를 수신할 필요가 있는 경우 필요한 경우라면, 새롭게 추가된 setExact 메서드를 사용하는 것이 좋다.<br>
