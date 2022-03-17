import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modern_form_esys_flutter_share/modern_form_esys_flutter_share.dart';
import 'package:residigital/app/modules/home/controllers/home_controller.dart';
import 'package:screenshot/screenshot.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailResiView extends GetView<HomeController> {
  final HomeController HomeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var dataResi = Get.arguments;
    // print(dataResi);
    return Scaffold(
      appBar: AppBar(
        title: Text('Resi'),
      ),
      body: Screenshot(
        controller: HomeC.screenshotController,
        child: Container(
          height: Get.height * 0.77,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      height: 195,
                      child: Image.asset(
                        'lib/app/images/JasaMarga.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Info Toll : ',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Icon(Icons.call, size: 20),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '14080',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Gerbang Tol',
                      style: TextStyle(
                          color: Colors.grey[500], fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${dataResi[0].gerbangExit}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Text(
                      '${dataResi[0].metoda}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Text(
                      'No Kartu',
                      style: TextStyle(
                          color: Colors.grey[500], fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${dataResi[0].nomorKartu}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Text(
                      'Waktu Transaksi',
                      style: TextStyle(
                          color: Colors.grey[500], fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${dataResi[0].tglTransaksi}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Golongan',
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '${dataResi[0].golongan}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tarif',
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Rp. ${dataResi[0].tarif}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No Seri',
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '${dataResi[0].noResi}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: QrImage(
                            data: "${dataResi[0].nomorKartu}",
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HomeC.screenshotController
              .capture(delay: Duration(milliseconds: 10))
              .then((capturedImage) async {
            await Share.file('Resi e-Toll', 'screenshot.png',
                capturedImage!.buffer.asUint8List(), 'image/jpg');
          }).catchError((onError) {
            print(onError);
          });
        },
        child: Icon(
          Icons.share,
          color: Colors.amber,
        ),
      ),
    );
  }
}
