package com.emsoluciones.app.sendsms;

import android.Manifest;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.telephony.SmsManager;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * SendsmsPlugin
 */
public class SendsmsPlugin implements MethodCallHandler {

    private MethodChannel methodChannel;

    private Activity activity;

    public SendsmsPlugin(Activity activity, MethodChannel methodChannel) {
        this.activity = activity;
        this.methodChannel = methodChannel;
        this.methodChannel.setMethodCallHandler(this);
    }

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "sendsms");
        channel.setMethodCallHandler(new SendsmsPlugin(registrar.activity(), channel));
    }

    
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

        // Solicitud de Permiso
        if (ActivityCompat.checkSelfPermission(activity, Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(activity, new String[]{Manifest.permission.SEND_SMS,}, 1000);
        }

        if (call.method.equals("sendSMS")) {
            try {
                // Data
                String phoneNumber = call.argument("phoneNumber").toString();
                String message = call.argument("message").toString();

                SmsManager smsManager = SmsManager.getDefault();
                smsManager.sendTextMessage(phoneNumber, null, message, null, null);

                Log.d("Succes", "ok");
            } catch (Exception er) {
                Log.d("Error", "ERROR " + er.getMessage());
            }
        } else {
            result.notImplemented();
        }

    }

}
