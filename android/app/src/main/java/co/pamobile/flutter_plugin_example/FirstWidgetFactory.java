package co.pamobile.flutter_plugin_example;

import android.content.Context;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;


public class FirstWidgetFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;
    // private final BinaryMessenger messenger;
    // private final Activity activity;

    public FirstWidgetFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int i, Object args) {
        return new FirstWidget(context,messenger,i);
    }
}
