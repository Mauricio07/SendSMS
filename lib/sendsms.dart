import 'dart:async';

import 'package:flutter/services.dart';

class Sendsms {
  static const MethodChannel _channel = const MethodChannel('sendsms');

  ///
  /// Envia Mensaje de texto desde la aplicacion
  ///
  /// @param phoneNumber  Número a enviar.
  /// @param message     Mensaje de texto.
  ///
  static Future<Null> onSendSMS(String phoneNumber, String message) async {
    Map<String, String> params = <String, String>{
      "phoneNumber": phoneNumber,
      "message": message
    };
    await _channel.invokeMethod('sendSMS', params);
  }

  static Future<bool> onGetPermission() async {
    return await _channel.invokeMethod("getPermission");
  }
}
