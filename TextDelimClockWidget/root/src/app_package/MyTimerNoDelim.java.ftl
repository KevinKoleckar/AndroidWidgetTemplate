package ${packageName};

import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Context;
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

    public synchronized void runAndUpdateTheWidget() {

        int[] allWidgetIds = appWidgetManager.getAppWidgetIds(thisWidget);

        for (final int appWidgetId : allWidgetIds) {

            System.out.println("UPDATING......" + getTodaysTime() + " ID = "
                    + appWidgetId);

            remoteViews.setImageViewBitmap(R.id.imageView_txt,
                    buildUpdate(getTodaysTime()));
            appWidgetManager.updateAppWidget(appWidgetId, remoteViews);

        }

    }

    public Bitmap buildUpdate(String time) {
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
        paint.setColor(Color.WHITE);
        paint.setTextSize(50);
        paint.setTextAlign(Paint.Align.CENTER);
        myCanvas.drawText(time[0]+time[1], bmpWidth / 2, bmpHeight / 2,
                paint);

        return myBitmap;
    }

    public String[] getTodaysTime() {
        final Calendar c = Calendar.getInstance();
        int hour = convertToNormal(c.get(Calendar.HOUR_OF_DAY));
        int minute = c.get(Calendar.MINUTE);
        //int seconds = c.get(Calendar.SECOND);
        String hours=EnglishNumberToWords.convertThisNumber(hour);
        String mins=pad(minute);
        String[] time={
                hours,
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