### Start an Alarm When the Device Boots
 기본적으로 디바이스를 종료하면 모든 알람은 취소된다. 이러한 상황이 벌어지는 것을 막기 위해, 유저가 디바이스를 재부팅했을 때, 앱이 자동적으로 알람을 재구동 하도록 설계할 수 있다. 이것은 `AlarmManager`가 유저의 수동적 알람 재구동 없이 지속적으로 작업을 할 수 있도록 해준다.<br>
설계 단계는 다음과 같다.<br><br>
## 1. 앱 Manifest에 `RECEIVE_BOOT_COMPLETED` 권한을 설정한다.
 이 액션은 시스템 부팅 완료 후 broadcast인 `ACTION_BOOT_COMPLETED`를 받을 수 있도록 해준다.<br>
(유저가 앱을 적어도 한 번 이상 실행했을 경우에만 적용)<br><br>

```
<uses-permission android:name=”android.permission.RECEIVE_BOOT_COMPLETED”/>
```

## 2. BroadCast를 전달받을 수 있도록 `BoradcastReceiver`를 적용한다.<br>
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
