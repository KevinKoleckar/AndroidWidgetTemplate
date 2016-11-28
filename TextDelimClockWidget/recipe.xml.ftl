<?xml version="1.0"?>
<recipe>
    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <instantiate from="res/layout/activity_settings_page.xml.ftl"
            to="${escapeXmlAttribute(resOut)}/layout/activity_settings_page.xml" />
    
    <instantiate from="res/layout/my_widget_provider.xml.ftl"
            to="${escapeXmlAttribute(resOut)}/layout/my_widget_provider.xml" />
    
    <instantiate from="res/layout/widget_main.xml.ftl"
            to="${escapeXmlAttribute(resOut)}/layout/widget_main.xml" />
    
    <copy from="${font}"
            to="src/main/assets/myFont.ttf"/>
    
    <#if background != "assets/background.png">
        <copy from="${background}"
                to="src/main/res/mipmap-xxhdpi/background/background.png"/>
    </#if>
        
    <instantiate from="src/app_package/EnglishNumberToWords.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/EnglishNumberToWords.java"/>
    
    <instantiate from="src/app_package/MyAppWidgetProvider.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/MyAppWidgetProvider.java" />

    <instantiate from="src/app_package/RepeatingAlarm.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/RepeatingAlarm.java" />

    <instantiate from="src/app_package/SettingsPage.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/SettingsPage.java" />
    

    <instantiate from="src/app_package/MyTimer.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/MyTimer.java" />

    <open file="${escapeXmlAttribute(srcOut)}/SettingsPage.java" />
    <open file="${escapeXmlAttribute(srcOut)}/MyTimer.java" />
</recipe>
