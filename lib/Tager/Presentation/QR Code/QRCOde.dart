import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/Navigation/navigation.dart';

class QRCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QRCode')),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //
          children: [
            ElevatedButton(onPressed:(){
              navigato(context,               QRCodeCreate()
              );
    print('Create Qr Code');
    }, child: Text('Create Qr Code'),),
            ElevatedButton(onPressed:(){
              navigato(context, QrCodeScane());
              print('Scan Qr Code');
            }, child: Text('Scan Qr Code'),)
          ],
        ),
      ) ,
    );
  }
}


class QRCodeCreate extends StatefulWidget {
  @override
  _QRCodeCreateState createState() => _QRCodeCreateState();
}
class _QRCodeCreateState extends State<QRCodeCreate> {
  var qrValue='ss';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Code')),
      body:
       Column(

        children: [
          SizedBox(height: 10.h,),
           Center(child: BarcodeWidget(data:qrValue, barcode: Barcode.qrCode(),color: Colors.purple,height: 100,width: 100,))

        ,
        SizedBox(height: 20.0,),
        Container(
            alignment: Alignment.center,
           width: MediaQuery.of(context).size.width*.8,
           child: TextField(
              onChanged: (
                    (value) {
              setState(() {
                qrValue = value;
              });
            }),
            decoration: InputDecoration(
              hintText: 'enter Qr Code',
              border: OutlineInputBorder(

              ),
            ),

            ),
         )
        ],

      ),
    );
  }
}













class QrCodeScane extends StatefulWidget {
  @override
  _QrCodeScaneState createState() => _QrCodeScaneState();
}

class _QrCodeScaneState extends State<QrCodeScane> {
  var QRScan='lets hhh';
  var QRSCAn2='ffff';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QrCodeScane')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(child: Text(QRScan)),
          ElevatedButton(onPressed: (){
           int ss=100;
            print( QRSCAn2+ss.toString());
          }, child:Text('QRScan')),

        ],
      ),
    );
  }

  Future<void>ScanQr()async{

    try{
      FlutterBarcodeScanner.scanBarcode('#2A99Cf', 'Cancel', true, ScanMode.QR).then((value) {
       setState(() {
         QRScan=value;
       });


      });
    }
    catch(e){
      setState(() {
        QRScan='un hnandel QRScan';
      });
    }
  }
}



