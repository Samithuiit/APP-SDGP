// "QR Code Scanner app adapted from the "qr-app-flutter" project by Bhism. Available at https://github.com/bhism/qr-app-flutter."

import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:sdgpapp/Locationgetter.dart';


class QRscanSecond extends StatefulWidget {

final String type;

final String phonenum;
  QRscanSecond(this.type,this.phonenum);



  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<QRscanSecond>{
  String? _qrInfo = 'Scan a QR/Bar code';
  bool camState = false;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;


// // remove
// showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Location'),
//         content: Text(widget.type+ widget.phonenum),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Close'),
//           ),
//         ],
//       );
//     },
//   );



                        Navigator.push(
      context,

      MaterialPageRoute(builder: (context) => Locationgetter(widget.type, widget.phonenum)),
    );
  


    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (camState == true) {
            setState(() {
              camState = false;
            });
          } else {
            setState(() {
              camState = true;
            });
          }
        },
        child: Icon(Icons.camera),
      ),
      body: camState
          ? Center(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: QRBarScannerCamera(
                  onError: (context, error) =>
                        
                   Text(
                    
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                    
                  ),

                  qrCodeCallback: (code) {
                    qrCallback(code);
                  },
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Code :" + _qrInfo!,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
                
              ),
            ),



    );
    
    
    
  }
  
  onerror() {}
}