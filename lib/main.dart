// ignore_for_file: dead_code, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:barcode/barcode.dart';
// import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcodeapp/QRCamera.dart';
import 'package:qrcodeapp/stack/stack.dart';

// void main() {
//   runApp(MaterialApp(home: stack(),));
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String code = '';
  String getCode = '';
  final _controller = TextEditingController();
  // Future ScanCode()async{
  //   getCode = await bc.
  // }

  @override
  Widget build(BuildContext context) {
// @override
    Widget buildTextfild(
            BuildContext context, TextEditingController datainput) =>
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: datainput,
            showCursor: true,
            onSubmitted: (value) => setState(() {
              value = datainput.text;
              value.isEmpty ? print("emp") : print("object");
            }),
            decoration: InputDecoration(
                suffix: IconButton(
              onPressed: () {
                
                setState(() {});
              },
              icon: Icon(Icons.check),
            )),
          ),
        );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    QrImage(
                      data: _controller.text,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    buildTextfild(context, _controller),
                    Text(
                      'Some here',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScnarCode(),
              ),
            );
          },
          tooltip: 'QR Code Scanner',
          child: const Icon(Icons.qr_code),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );

    // @override
    // Widget buildTextfild(BuildContext context) => TextField(controller: _controller,);
  }
}
