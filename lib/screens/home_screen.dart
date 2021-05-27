import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import './webview_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String kode = "";
  var getKode;
  Future scanBarcode() async {
    getKode = await BarcodeScanner.scan();
    setState(() {
      kode = getKode.rawContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: Text("QR Code Scanner"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Image.network(
              "https://img.freepik.com/free-psd/hand-using-mobile-smart-phone-scan-qr-code-mockup-template-your-design_34168-1792.jpg?size=626&ext=jpg"),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(
            onPressed: () {
              scanBarcode();
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    "SCAN QR CODE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan[900],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),

          Text(""),

          FlatButton(
            onPressed: kode == ""
                ? () {}
                : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebScreen(kode),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: kode == ""
                      ? Text(
                    "QR CODE URL",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  )
                      : Text(
                    kode,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan[900],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
