import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

// import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  String qrResult = "Scanned data will appear here";
  String? _barcode;
  late bool visible;

  Future<void> scanQR() async {
    try {
      // For single scan
      // final barcode = await FlutterBarcodeScanner.scanBarcode(
      //   '#ff6666', // line color
      //   'Cancel', // cancel button text
      //   true, // whether to show flash icon
      //   ScanMode.QR, // scan mode
      // );

      // if (!mounted) return;
      // setState(() {
      //   qrResult = barcode == '-1' ? 'Scan cancelled' : barcode;
      // });
    } on PlatformException {
      if (!mounted) return;
      setState(() {
        qrResult = "Failed to read QR Code";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("QR Code Scanner"),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(qrResult, style: TextStyle(color: Colors.black)),
              SizedBox(height: 30),
              // ElevatedButton(onPressed: scanQR, child: Text("Scan Code")),
              ElevatedButton(
                onPressed: () async {

                  SimpleBarcodeScanner.streamBarcode(
                    context,
                    barcodeAppBar: const BarcodeAppBar(
                      appBarTitle: 'Test',
                      centerTitle: false,
                      enableBackButton: true,
                      backButtonIcon: Icon(Icons.arrow_back_ios),
                    ),
                    isShowFlashIcon: true,
                    delayMillis: 2000,
                  ).listen((event) {
                    print("Stream Barcode Result: $event");
                  });
                },
                child: const Text('Open Scanner'),
              ),

              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () async {

                  String? res = await SimpleBarcodeScanner.scanBarcode(
                    context,
                    barcodeAppBar: const BarcodeAppBar(
                      appBarTitle: 'Test',
                      centerTitle: false,
                      enableBackButton: true,
                      backButtonIcon: Icon(Icons.arrow_back_ios),
                    ),
                    isShowFlashIcon: true,
                    delayMillis: 2000,
                    cameraFace: CameraFace.front,
                  );
                  setState(() {
                    qrResult = res as String;
                  });
                },
                child: const Text('Open Scanner 2'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*Center(
          // Add visiblity detector to handle barcode
          // values only when widget is visible
          child: BarcodeKeyboardListener(
            bufferDuration: Duration(milliseconds: 200),
            onBarcodeScanned: (barcode) {
              if (!visible) return;
              print(barcode);
              setState(() {
                _barcode = barcode;
              });
            },
            useKeyDownEvent: Platform.isWindows,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _barcode == null ? 'SCAN BARCODE' : 'BARCODE: $_barcode',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => QrCodeScanner(),
                      ),
                    ),
                    child: Center(child: Text('Second screen')),
                  ),
                ),
              ],
            ),
          ),
          */
/* child: VisibilityDetector(
            onVisibilityChanged: (VisibilityInfo info) {
              visible = info.visibleFraction > 0;
            },
            key: Key('visible-detector-key'),

          ),*/