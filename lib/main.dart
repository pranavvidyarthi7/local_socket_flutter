import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://192.168.1.6:3000');

  @override
  Widget build(BuildContext context) {
    // channel.stream.listen((event) {
    //   print(event);
    // });
    Future.delayed(Duration(seconds: 30), () {
      channel.sink.add('Working');
      print('MESSAGE SENT');
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('APP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SERVER DATA BELOW:',
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                print('Data ${snapshot.hasData}');
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : 'NO'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
