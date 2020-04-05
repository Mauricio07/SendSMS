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
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[            
            RaisedButton(
              child: Text("Enviar SMS"),
              onPressed: () async{
                String phoneNumber = "";
                String message = "";
                await Sendsms.onSendSMS(phoneNumber, message);
              },
            )
          ],
        )
      ),
    );
  }
}
