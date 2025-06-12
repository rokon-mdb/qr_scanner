import 'package:flutter/material.dart';
import 'package:qr_code_scanner/ui/qr_code_generator.dart';
import 'package:qr_code_scanner/ui/qr_code_scanner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("QR Code App"),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => QrCodeScanner()),
                  );
                },
                child: Text("QR Code Scanner"),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => QrCodeGenerator()),
                  );
                },
                child: Text("QR Code Generator"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
