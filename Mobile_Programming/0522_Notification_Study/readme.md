## Schedule repeating alarms

�˶�(`AlarmManager`Ŭ������ ������� ��)�� ����ϸ� ���� App Lifetime �̿��� �ð� ����� �۾��� ���� �� �� �ִ�.<br>
 ���� ���, �ʴ� �Ϸ翡 �� �� �ϱ⿹���� �ٿ�ޱ� ���� service�� �����ϴ� �� ó��, ��� ���� �۾��� �����ϱ� ���� �˶��� ����� �� �ִ�.<br><br>

�˶����� ������ ���� Ư¡�� �ִ�.<br><br>

- ������ �ð��� �Ǵ�, �������� `Intent`�� �߻���ų �� �ִ�.
- `broadcast receiver`�� �Բ� ����ϸ� ���񽺸� �����ϰ� �ٸ� �۾��� ���� �� �� �ִ�.
- Application �ܺο��� �۵��ϹǷ�, Application�� ����ǰ� ���� �ʰų� device ��ü�� sleep������ ��쿡�� Application�� ����Ͽ� event�� action�� �߻���ų �� �ִ�.
- Application�� resource requirement�� �ּ�ȭ�ϴ� �� ������ �ȴ�. ����, timers�� ���������� ����Ǵ� background service�� �������� �ʰ� �۾��� ������ �� �ִ�.<br>

```
���� ����ִ� ���� �۵��� ���� Ȯ���� Ÿ�̹� �۾��� ���,
Timer�� Thread�� �Բ� Handler Ŭ������ ����ϴ� ���� ��õ�Ѵ�.
�� ����� �ȵ���̵忡�� �ý��� ���ҽ� ��� ���� �� �� �� �ֵ��� �Ѵ�.
```

### Decide how precise your alarm needs to be
���� ������ �ٿ� ����, �˶��� ������ �� ���� ù �ܰ�� �ַ� �˶� Ÿ���� �����ϴ� ���̴�. ���� �ܰ�� �˶��� �󸶳� ��Ȯ�ؾ� �ϴ��� �����ϴ� ���̴�. ��κ��� �۵鿡�� `setInexactRepeating()`�� �����ϴ�.<br>
 �� �޼ҵ带 ����ϸ� �ȵ���̵�� �������� ����Ȯ�� �ݺ� �˶����� ����ȭ�Ͽ� ���ÿ� �۵���Ų��. �̸����� ���͸� �Ҹ� ���� �� �ְԵȴ�.<br><br>
��Ȯ�� �ð��� �䱸�Ǵ� �۵��� ����??`���� ���, ��Ȯ�� ���� 8:30 ���� �����Ͽ� �� �� �� ���ÿ� �۵��Ǿ�� �ϴ� �˶�` �� `setRepeating()`�� ����Ѵ�. ������ ������ �˶��� ���ҽ��� ������ ��ĥ�� ������ ������� �ʴ°��� ����.<br><br>
`setInexactRepeating()`������ `setRepeating()`�� ���� Ŀ���� ���͹��� ������ �� ����. `INTERVAL_FIFTEEN_MINUTES`, `INTERVAL_DAY` ���� ���͹� ����� ����ؾ߸� �Ѵ�. ��ü ����� ������ AlarmManager�� �����Ѵ�.<br>


### Cancle an Alarm
�ۿ� ���� �˶� ����ϴ� ����� �߰��ϰ� ���� �� ���� ���̴�. �˶��� ����ϱ� ���ؼ���, Alarm Manager ���� cancel() �� ȣ�������ν� ���̻� �۵��� ������ �ʴ� PendingIntent �� �����Ѵ�.<br><br>
```
// If the alarm has been set, cancel it.
if (alarmMgr!= null) {
alarmMgr.cancel(alarmIntent);
}
```


### Start an Alarm When the Device Boots
 �⺻������ ����̽��� �����ϸ� ��� �˶��� ��ҵȴ�. �̷��� ��Ȳ�� �������� ���� ���� ����, ������ ����̽��� ��������� ��, ���� �ڵ������� �˶��� �籸�� �ϵ��� ������ �� �ִ�. �̰��� `AlarmManager`�� ������ ������ �˶� �籸�� ���� ���������� �۾��� �� �� �ֵ��� ���ش�.<br>
���� �ܰ�� ������ ����.<br><br>
### 1. �� Manifest�� `RECEIVE_BOOT_COMPLETED` ������ �����Ѵ�.
 �� �׼��� �ý��� ���� �Ϸ� �� broadcast�� `ACTION_BOOT_COMPLETED`�� ���� �� �ֵ��� ���ش�.<br>
(������ ���� ��� �� �� �̻� �������� ��쿡�� ����)<br><br>

```
<uses-permission android:name=��android.permission.RECEIVE_BOOT_COMPLETED��/>
```

### 2. BroadCast�� ���޹��� �� �ֵ��� `BoradcastReceiver`�� �����Ѵ�.<br>
```public class SampleBootReceiver extends BroadcastReceiver {
	@Override
	public void onReceive(Context context, Intent intent) {
	if (intent.getAction().equals(��android.intent.action.BOOT_COMPLETED��)) {
	// Set the alarm here.
   }
  }
}
```
### 3. ����Ʈ ���ͷ� `ACTION_BOOT_COMPLETED` �׼��� Manifest�� ����Ѵ�.<br>
```
<receiver android:name=��.SampleBootReceiver��
android:enabled=��false��>
<intent-filter>
<action android:name=��android.intent.action.BOOT_COMPLETED��></action>
</intent-filter>
</receiver>
```
�Ŵ��佺Ʈ������ ��Ʈ ���ù��� android:enabled=��false�� �� ���õǾ� �ִ� ���� �� �� �ִ�. �װ��� ���� ��������� ���ǵ��� �������� �ʴ� �̻� ���ù��� ȣ����� ������ ���Ѵ�. �̰��� ��Ʈ ���ù��� ���ʿ��ϰ� ȣ��Ǵ� ���� ���´�. ���� ������� ���ù��� Ȱ��ȭ �� �� �ִ� (���� ���, ������ �˶��� ������ ��)<br>
```
ComponentName receiver = new ComponentName(context, SampleBootReceiver.class);
PackageManager pm = context.getPackageManager();
pm.setComponentEnabledSetting(receiver,
PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
PackageManager.DONT_KILL_APP);
```
���� ���ù��� �̿� ���� ������� Ȱ��ȭ�ϸ�, ������ ����̽��� ����� �Ͽ��� Ȱ��ȭ �� ���°� ������ �� �ִ�. ��, ���α׷��� ������� ���ù��� Ȱ��ȭ�ϴ� ���� ����� ���� ��Ȳ������ �Ŵ��佺Ʈ ������ ���� �� �ִٴ� ���̴�. ���� ��Ȱ��ȭ ��ų ������ ���ù��� Ȱ��ȭ �� ������ ���̴�. ������ ���� ������� ���ù��� ��Ȱ��ȭ ��ų �� �ִ� (���� ���, ������ �˶��� ����� ��)<br><br>
```
ComponentName receiver = new ComponentName(context, SampleBootReceiver.class);
PackageManager pm = context.getPackageManager();
pm.setComponentEnabledSetting(receiver,
PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
PackageManager.DONT_KILL_APP)
```

<br>AlarmManager �� set �� setRepeating �޼��带 ����ϰ� �ִ� �����, API 19 ���ʹ� �̺�Ʈ�� �߻��ϴ� ������ ��Ȯ�� ��ġ���� ���� �� �ִٴ� ���� ������ �ξ�� �Ѵ�. ������ ���� ���� ���� ��Ȯ�� �ð� ���� �߻��ϴ� �̺�Ʈ�� ������ �ʿ䰡 �ִ� ��� �ʿ��� �����, ���Ӱ� �߰��� setExact �޼��带 ����ϴ� ���� ����.<br>
