<?xml version="1.0" encoding="utf-8"?>

<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent" android:layout_height="match_parent"
    android:id="@+id/widget_root"
    android:layout_gravity="center"
    android:baselineAligned="false"
    android:orientation="vertical" >

    <ImageView
        android:id="@+id/imageView_bg"
        android:layout_width="fill_parent"
        android:layout_height="fill_parent"
        android:contentDescription="@mipmap/ic_launcher"
        android:scaleType="fitCenter"
        />

    <ImageView
        android:id="@+id/imageView_txt"
        android:layout_width="fill_parent"
        android:layout_height="fill_parent"
        android:scaleType="fitCenter"
        android:contentDescription="@mipmap/ic_launcher" />
</FrameLayout>