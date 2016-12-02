<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}" >

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name">
        <activity
            android:name="${packageName}.SettingsPage"
            android:configChanges="keyboardHidden|orientation"
            android:label="@string/app_name">
            <intent-filter>
                <action android:name="android.appwidget.action.APPWIDGET_CONFIGURE" />
            </intent-filter>
        </activity>
        <receiver
            android:name="${packageName}.RepeatingAlarm"
            android:process=":remote" />

        <!-- Broadcast Receiver that will process AppWidget Updates -->
        <receiver
            android:name="${packageName}.MyAppWidgetProvider"
            android:label="@string/app_name" >
            <intent-filter>
                <action android:name="android.appwidget.action.APPWIDGET_UPDATE" />
            </intent-filter>

            <meta-data
                android:name="android.appwidget.provider"
                android:resource="@layout/my_widget_provider" />
        </receiver>
    </application>

</manifest>
