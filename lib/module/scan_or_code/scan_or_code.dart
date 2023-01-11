import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:task11/model/login_model.dart';
import 'package:task11/module/result_screen/result_screen.dart';

import '../../model/scan_model.dart';
import '../../shared/componant/componants.dart';
import '../../shared/componant/constains.dart';
import '../../shared/network/dio_helper.dart';

class ScanOrCode extends StatefulWidget {
  ScanOrCode({Key? key}) : super(key: key);

  @override
  State<ScanOrCode> createState() => _ScanOrCodeState();
}

class _ScanOrCodeState extends State<ScanOrCode> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? qrViewController;
  Barcode? barcode;

  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrViewController!.pauseCamera();
    }
    qrViewController!.resumeCamera();
  }

  ScanModel? scanModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      DioHelper.postData(
                              url: ScanUrl,
                              data: {'token': token, 'code': barcode!.code})
                          .then((value) {
                        setState(() {
                          scanModel = ScanModel.fromJson(value.data);
                        });
                        navigateAndFinish(context, const ResultScreen());
                      }).catchError((erorr) {});
                    },
                    child: customIcon(Image: 'assets/images/Group 11.jpg'),
                  ),
                ],
              ),
              Text(
                'Scan OR code',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                'Place qr code inside the frame to scan please avoid shake to get results quickly',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 10, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 40, bottom: 10),
                child: Container(
                    height: 250, width: 300, child: buildQRView(context)),
              ),
              Text(
                'Scanning Code...',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 10, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                barcode != null ? '${barcode!.code}' : 'result here',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.image),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.image_aspect_ratio_outlined),
                  ),
                  Icon(Icons.flash_on)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrangeAccent,
                ),
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      // saveResult();
                    },
                    child: Text(
                      'Place Camera Code',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutSize: 180,
          borderRadius: 10,
          borderLength: 10,
          borderWidth: 10,
          borderColor: Colors.deepOrange),
    );
  }

  void onQRViewCreated(QRViewController p1) {
    setState(() {
      qrViewController = p1;
    });
    qrViewController!.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
        }));
  }
}
