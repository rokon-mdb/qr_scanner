import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({super.key});

  @override
  _QrCodeGeneratorState createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  TextEditingController urlController = TextEditingController();
  bool showQR = false; // Initially false to show placeholder

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("QR Code Generator"),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),

        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: showQR
                      ? QrImageView(data: urlController.text, size: 200)
                      : QrImageView(data: "QR", size: 200),
                  /*Image.asset(
                    'assets/placeholder.png', // Add this image in your assets folder
                    width: 200,
                    height: 200,
                  ),*/
                ),

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: urlController,
                    decoration: InputDecoration(
                      label: Text("Text Enter"),
                      hintText: "Enter your data",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: generateQR,
                  child: Text("Generate QR code"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  void generateQR() {
    if (urlController.text.isNotEmpty) {
      setState(() {
        showQR = true;
      });
    }
  }
}
