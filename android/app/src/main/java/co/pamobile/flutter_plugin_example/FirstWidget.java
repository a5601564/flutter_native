package co.pamobile.flutter_plugin_example;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.platform.PlatformView;

public final class FirstWidget implements PlatformView {

    CurvedText curvedText;
    public View getView() {
        return this.curvedText;
    }

    @Override
    public void dispose() {
    }
    double font = 60;
    String text = "card name";
    String type = "minion";
    FirstWidget(Context context, BinaryMessenger messenger, int id) {
        curvedText = new CurvedText(context, 1, "minion");
        curvedText.init(3,"minion");

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.MATCH_PARENT);
        curvedText.setLayoutParams(params);
        curvedText.setTextOnPath("Hello Card Name",50);
        Log.e("EEE","plugins/first_widget_"+id);
        (new MethodChannel(messenger, "plugins/first_widget_" + id)).setMethodCallHandler(((call, result) -> {

            if (call.method.equals( "ping")) {
                result.success("ping success");

            } else
                if (call.method.equals( "setType")) {

                type = call.arguments.toString();
                setCurvedTextType(curvedText,text,type,font);
                result.success("setType success");

            }else if (call.method.equals( "setFont")) {

               font = (double) call.arguments;
                setCurvedTextType(curvedText,text,type,font);
                result.success("setFont success");

            }else if (call.method.equals( "setText")) {

                text = call.arguments.toString();
                setCurvedTextType(curvedText,text,type,font);
                result.success("setText success");
            }
            else {
                result.notImplemented();
            }
        }));
    }

    void setCurvedTextType(CurvedText curvedText,String text,String type,double fontSize){
        float floatFontSize = (float) fontSize;
        if(type.equals("spell")){
            Log.e("call ","spell");
            curvedText.init(3,"spell");
            curvedText.setTextOnPath(text,floatFontSize);
            curvedText.invalidate();
        } else if(type.equals("minion")) {
            Log.e("call ","minion");
            curvedText.init(3,"minion");
            curvedText.setTextOnPath(text,floatFontSize);
            curvedText.invalidate();
        } else {
            Log.e("call ","hero");
            curvedText.init(3,"hero");
            curvedText.setTextOnPath(text,floatFontSize);
            curvedText.invalidate();
        }
    }
}