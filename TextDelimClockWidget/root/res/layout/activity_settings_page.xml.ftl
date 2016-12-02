<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    tools:context="${packageName}.SettingsPage"
    android:gravity="center_horizontal">



    <Switch
        android:id="@+id/background_checkBox"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:clickable="true"
        android:text="@string/background_img"
        android:layout_marginTop="30dp"
        android:checked="true"
        <#if background == "assets/background.png">
        </#if>
        />

    <Switch
        android:id="@+id/delim"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="30dp"
        android:text="@string/hr_min_seperator" />

    <TextView
        android:text="@string/text_that_seperates_hr_min"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:id="@+id/delimLabel"
        android:labelFor="@+id/delimText"
        android:gravity="center_horizontal"
        android:paddingTop="20dp"
        android:visibility="gone" />

    <EditText
        android:id="@+id/delimText"
        android:layout_width="300dp"
        android:layout_height="wrap_content"
        android:background="@android:color/darker_gray"
        android:visibility="gone"
        android:inputType="text" />

    <TextView
        android:text="@string/font_color_label"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:id="@+id/colorLabel"
        android:gravity="center_horizontal"
        android:layout_marginTop="40dp"
        android:labelFor="@+id/radiogroup" />

    <RadioGroup
        android:id="@+id/radiogroup"
        android:layout_width="wrap_content"
        android:layout_height="fill_parent"
        android:checkedButton="@+id/radioBlack"
        android:orientation="horizontal">

        <RadioButton
            android:id="@+id/radioBlack"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:shadowColor="#2a2a2a"
            android:text="@string/black"
            android:layout_width="wrap_content" />

        <RadioButton
            android:id="@+id/radioRed"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:shadowColor="#ff0000"
            android:text="@string/red"
            android:textColor="#ff0000"
            android:layout_marginLeft="20dp"
            android:layout_marginRight="20dp"
            android:layout_width="wrap_content" />

        <RadioButton
            android:id="@+id/radioWhite"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:shadowColor="#ffffff"
            android:text="@string/white"
            android:textColor="?android:attr/textColorTertiary"
            android:layout_width="wrap_content" />
    </RadioGroup>

    <TextView
        android:text="@string/font_size_label"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:id="@+id/sizeLabel"
        android:labelFor="@+id/fontSize"
        android:gravity="center_horizontal"
        android:layout_marginTop="40dp" />

    <EditText
        android:layout_height="wrap_content"
        android:inputType="number"
        android:ems="10"
        android:id="@+id/fontSize"
        android:background="@android:color/darker_gray"
        android:text="@string/_50"
        android:layout_width="200dp" />

    <Button
        android:id="@+id/create_widget"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="30dp"
        android:text="@string/widget_settings_submit_button_text" />

</LinearLayout>