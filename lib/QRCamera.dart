// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScnarCode extends StatefulWidget {
  const ScnarCode({Key? key}) : super(key: key);

  @override
  _ScnarCodeState createState() => _ScnarCodeState();
}

class _ScnarCodeState extends State<ScnarCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildQrOverview(context) => QRView(
          key: qrKey,
          onQRViewCreated: onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderRadius: 20,
            borderColor: Colors.white,
            borderLength: 20,
            overlayColor: Colors.blue.withOpacity(0.6),
          ),
        );

    Widget buildResult() => Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey,
          child: Text(
            result != null ? "Result ${result!.code}" : 'Scan Qr code',
            maxLines: 5,
          ),
        );

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrOverview(context),
          Positioned(bottom: 10, child: buildResult())
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
