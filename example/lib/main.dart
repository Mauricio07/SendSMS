import 'package:flutter/material.dart';
import 'package:sendsms/sendsms.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Envio SMS desde la aplicación'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: RaisedButton(
            child: Text("Enviar SMS"),
            onPressed: () async {
              String phoneNumber = "";
              String message = "";
              Sendsms.onSendSMS(phoneNumber, message);
            },
          ),
        ),
      ),
    );
  }
}
