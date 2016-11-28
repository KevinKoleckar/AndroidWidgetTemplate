package ${packageName};

import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.widget.RemoteViews;

import java.util.Calendar;

/**
 * Created by test on 5/21/14.
 */
public class MyTimer {
    RemoteViews remoteViews;
    Context context;
    AppWidgetManager appWidgetManager;
    ComponentName thisWidget;

    public MyTimer(Context context) {

        appWidgetManager = AppWidgetManager.getInstance(context);

        this.context = context;

        remoteViews = new RemoteViews(context.getPackageName(),
                R.layout.widget_main);

        thisWidget = new ComponentName(context, MyAppWidgetProvider.class);

    }
    public static String loadDelimPref(Context context) {
        SharedPreferences prefs = context.getSharedPreferences("${packageName}.MyAppWidgetProvider", 4);
        String delim = prefs.getString("delimeter", null);
        if (delim != null) {
            return delim;
        } else {
            return context.getString(R.string.delimeter);
        }
    }
    
    public static String loadColorPref(Context context) {
        SharedPreferences prefs = context.getSharedPreferences("${packageName}.MyAppWidgetProvider", 4);
        String color = prefs.getString("color", null);
        if (color != null) {
            return color;
        } else {
            return "BLACK";
        }
    }
    
    public synchronized void runAndUpdateTheWidget() {
        String delim = loadDelimPref(context);
        String color = loadColorPref(context);
        
        int[] allWidgetIds = appWidgetManager.getAppWidgetIds(thisWidget);

        for (final int appWidgetId : allWidgetIds) {

            System.out.println("UPDATING......" + getTodaysTime(delim) + " ID = "
                    + appWidgetId);

            remoteViews.setImageViewBitmap(R.id.imageView_txt,
                    buildUpdate(getTodaysTime(delim), color));
            appWidgetManager.updateAppWidget(appWidgetId, remoteViews);

        }

    }

    public Bitmap buildUpdate(String[] time, String color) {
        int bmpWidth = 500;//250;
        int bmpHeight = 250;//100;
        Bitmap myBitmap = Bitmap.createBitmap(bmpWidth, bmpHeight, Bitmap.Config.ARGB_8888);
        Canvas myCanvas = new Canvas(myBitmap);
        Paint paint = new Paint();
//#################################################################################################
//###### TODO set your font
//#################################################################################################
        Typeface clock = Typeface.createFromAsset(context.getAssets(), "myFont.ttf");
//#################################################################################################
        paint.setAntiAlias(true);
        paint.setSubpixelText(true);
        paint.setTypeface(clock);
        paint.setStyle(Paint.Style.FILL);
        
        if("BLACK".equals(color)){
          paint.setColor(Color.BLACK);
        }
        if("RED".equals(color)){
          paint.setColor(Color.RED);
        }
        if("WHITE".equals(color)){
          paint.setColor(Color.WHITE);
        }
        
        paint.setTextSize(50);
        paint.setTextAlign(Paint.Align.CENTER);
        myCanvas.drawText(time[0]+time[1], bmpWidth / 2, bmpHeight / 3,
                paint);
        myCanvas.drawText(time[2], bmpWidth / 2, 2*bmpHeight / 3,
                paint);

        return myBitmap;
    }

    public String[] getTodaysTime(String delim) {
        final Calendar c = Calendar.getInstance();
        int hour = convertToNormal(c.get(Calendar.HOUR_OF_DAY));
        int minute = c.get(Calendar.MINUTE);
        //int seconds = c.get(Calendar.SECOND);
        String hours=EnglishNumberToWords.convertThisNumber(hour);
        String mins=pad(minute);
        String[] time={
                hours+" ",
                delim,
                mins
        };
        return time;
    }

    private static String pad(int c) {
        if (c >= 10){
            return EnglishNumberToWords.convertThisNumber(c);}
        else if(c==0){
            return "o'clock";}
        else{
            return "o'" + EnglishNumberToWords.convertThisNumber(c);}
    }

    public int convertToNormal(int hour) {
        if (hour > 12) {
            hour = hour - 12;
        }
        return hour;
    }

}

