package ${packageName};


import android.app.Activity;
import android.appwidget.AppWidgetManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Switch;
import android.widget.EditText;
import android.widget.RemoteViews;
import android.widget.RadioButton;
import android.widget.RadioGroup;


public class SettingsPage extends Activity implements View.OnClickListener{
    int thisWidgetId = AppWidgetManager.INVALID_APPWIDGET_ID;
    EditText delime;
    RadioGroup radiogroup;
    
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings_page);
        getIdOfCurrentWidget(savedInstanceState);
        ((Button) findViewById(R.id.create_widget)).setOnClickListener(this);
        ((Switch) findViewById(R.id.delim)).setOnClickListener(this);
        delime = (EditText) findViewById(R.id.delimText);
    }
    /**
     * Get the Id of Current Widget from the intent from the Widget or if it is
     * <span id="IL_AD9" class="IL_AD">the first time</span>
     **/
    void getIdOfCurrentWidget(Bundle savedInstanceState) {
        setResult(RESULT_CANCELED);
        Bundle extras = getIntent().getExtras();
        if(extras != null){
            thisWidgetId = extras.getInt(AppWidgetManager.EXTRA_APPWIDGET_ID,
                    AppWidgetManager.INVALID_APPWIDGET_ID);
        }
    }


    /**
     * Update the widget on first run
     *
     * @param widgetId
     *            - the ID of current widget to be created
     */
    public void updateWidget(int widgetId, boolean includeBackground, String delim, String color) {
        RemoteViews remoteViews = new RemoteViews(getPackageName(),
                R.layout.widget_main);

        MyTimer myTimer = new MyTimer(this);
        Bitmap bmp = myTimer.buildUpdate(myTimer.getTodaysTime(delim), color);
        remoteViews.setImageViewBitmap(R.id.imageView_txt, bmp);
<#if background != "assets/background.png">
        if(includeBackground){
            remoteViews.setImageViewResource(R.id.imageView_bg, R.mipmap.background);
        }
</#if>
        AppWidgetManager appWidgetManager = AppWidgetManager
                .getInstance(SettingsPage.this);
        // update the widget
        appWidgetManager.updateAppWidget(widgetId, remoteViews);
    }

    public void setResultDataToWidget(int result, int widgetId, boolean includeBackground, String delim, String color) {
        System.out.println("WID ID = " + widgetId);

        // update the widget on creation
        updateWidget(widgetId, includeBackground, delim, color);

        // set the result back to widget
        Intent resultValue = new Intent();
        // pass the widget ID along with the intent so that we will get it on
        // the cofiguration activity
        resultValue.putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, widgetId);
        setResult(result, resultValue);
        finish();
    }

//    @Override
//    public boolean onCreateOptionsMenu(Menu menu) {
//
//        // Inflate the menu; this adds items to the action bar if it is present.
//        getMenuInflater().inflate(R.menu.settings_page, menu);
//        return true;
//    }
//
//    @Override
//    public boolean onOptionsItemSelected(MenuItem item) {
//        // Handle action bar item clicks here. The action bar will
//        // automatically handle clicks on the Home/Up button, so long
//        // as you specify a parent activity in AndroidManifest.xml.
//        int id = item.getItemId();
//        if (id == R.id.action_settings) {
//            return true;
//        }
//        return super.onOptionsItemSelected(item);
//    }

    @Override
    public void onClick(View v) {
        final Context context = SettingsPage.this;
        Switch background = (Switch) findViewById(R.id.background_checkBox);
        
        String mdelim = delime.getText().toString();
        
        radiogroup = (RadioGroup) findViewById(R.id.radiogroup);
        RadioButton selectRadio = (RadioButton) findViewById(radiogroup.getCheckedRadioButtonId());
        String color = selectRadio.getText().toString();
        
        SharedPreferences.Editor prefs = context.getSharedPreferences("${packageName}.MyAppWidgetProvider", 4).edit();
        prefs.putString("delimeter", mdelim);
        prefs.putString("color", color);
        prefs.commit();
        
        if (v.getId() == R.id.create_widget) {
            Switch box = (Switch) findViewById(R.id.delim);
            if (box.isChecked()){
                setResultDataToWidget(Activity.RESULT_OK, thisWidgetId, background.isChecked(), mdelim, color);
            }
            else {
                setResultDataToWidget(Activity.RESULT_OK, thisWidgetId, background.isChecked(), "", color);
            }
        }
        if (v.getId() == R.id.delim){
            Switch box = (Switch) findViewById(R.id.delim);
            if (box.isChecked()){
                delime.setVisibility(View.VISIBLE);
            }
            else{
                delime.setVisibility(View.GONE);
            }
        }
    }



}
