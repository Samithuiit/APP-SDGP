// "QR Code Scanner app adapted from the "qr-app-flutter" project by Bhism. Available at https://github.com/bhism/qr-app-flutter."


import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class QRscanFirst extends StatefulWidget {

final String type;

final String phonenum;
  QRscanFirst(this.type,this.phonenum);


  
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<QRscanFirst> {

  TextEditingController title = TextEditingController();


  TextEditingController content = TextEditingController();

  // setting the text for the qr code 
void setText() {
    title.text = 'Your Text Here';
  }

  var code = '';
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(

           
            children: [
            
              Padding(
                padding: EdgeInsets.all(35),
             child:Visibility(
              visible: false,
                child: Container(
                  
                  
                  decoration: BoxDecoration(border: Border.all()),
        
            
            
                  child: TextFormField(
                    controller: title,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: ' Code ',
                

                    ),
                
                ),
                ),
             ),
              ),
              MaterialButton(
                color: Colors.indigo,
                onPressed: () {
                  // setting the phone num
                  setText();
                  setState(() {
                    code = title.text;
                  });
                },
                child: Text(
                  "Create",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              code == ''
                  ? Text('')
                  : BarcodeWidget(
                      barcode: Barcode.qrCode(
                        errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                      ),
                      data: '$code',
                      width: 400,
                      height: 400,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}