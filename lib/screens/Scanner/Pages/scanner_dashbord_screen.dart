import 'package:covid_safe_app/controllers/ScannerControllers/scanner_dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../widgets/profileAvatar.dart';

class ScannerDashBord extends StatefulWidget {
  const ScannerDashBord({Key? key}) : super(key: key);

  @override
  State<ScannerDashBord> createState() => _ScannerDashBordState();
}

class _ScannerDashBordState extends State<ScannerDashBord> {
  String imageUrl =
      'https://img.freepik.com/free-photo/handsome-young-businessman-shirt-eyeglasses_85574-6228.jpg?size=626&ext=jpg';

  final _scannerDashboardController = Get.put(ScannerDashBoardController());

  @override
  void initState() {
    _scannerDashboardController.setUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(child: Container(
        child: Obx(() {
          return Column(
            children: [
              Material(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                color: Colors.grey[900],
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Text(
                                  _scannerDashboardController.userName.value,
                                  style: TextStyle(
                                      fontSize: _size.height * 0.02,
                                      color: Colors.white),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: ProfileAvatar(
                                    imageUrl: imageUrl,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Covid-19 Scanner",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: _size.height * 0.03),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Material(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.grey[900],
                  child: Container(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Scan User for Pass Scan",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: _size.height * 0.02),
                          ),
                          InkWell(
                            onTap: () async {
                              var data =
                                  await FlutterBarcodeScanner.scanBarcode(
                                      "red", "Cancel", true, ScanMode.QR);
                              setState(() {});
                            },
                            child: Icon(
                              Icons.qr_code_scanner,
                              size: 40,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      )),
    );
  }
}
