<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    tools:context="${packageName}.SettingsPage"
    android:background="@android:color/background_dark"
    android:gravity="center_horizontal">



    <Switch
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Background img"
        android:id="@+id/background_checkBox"
        android:clickable="true"
        android:textColor="#ffffff"
        android:layout_marginTop="30dp"
        <#if background == "assets/background.png">
        </#if>
        />

    <Switch
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hr Min Seperator"
        android:id="@+id/delim"
        android:textColor="#ffffff"
        android:layout_marginTop="30dp"
        android:layout_below="@+id/background_checkBox"/>

    <EditText
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:id="@+id/delimText"
        android:text="freakin"
        android:editable="true"
        android:background="@android:color/darker_gray"
        android:layout_marginTop="30dp" />
    <RadioGroup
        android:layout_width="fill_parent"
        android:layout_height="fill_parent"
        android:layout_marginTop="30dp"
        android:orientation="horizontal"
        android:background="#000000"
        android:id="@+id/radiogroup"
        android:checkedButton="@+id/radioBlack">

        <RadioButton
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:id="@+id/radioBlack"
            android:shadowColor="#2a2a2a"
            android:layout_marginLeft="20dp"
            android:text="BLACK"
            android:textColor="#2a2a2a" />

        <RadioButton
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:id="@+id/radioRed"
            android:shadowColor="#ff0000"
            android:text="RED"
            android:layout_marginLeft="20dp"
            android:textColor="#ff0000" />

        <RadioButton
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:id="@+id/radioWhite"
            android:shadowColor="#ffffff"
            android:singleLine="false"
            android:text="WHITE"
            android:layout_marginLeft="20dp" />
    </RadioGroup>
    <Button
        android:id="@+id/create_widget"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Create Widget"
        android:layout_below="@+id/delim"
        android:layout_centerHorizontal="true"
        android:layout_marginTop="30dp" />

</LinearLayout>

