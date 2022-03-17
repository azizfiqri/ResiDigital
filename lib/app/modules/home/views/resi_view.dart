import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:residigital/app/models/resi_model.dart';
import 'package:residigital/app/modules/home/controllers/home_controller.dart';
import 'package:residigital/app/modules/home/views/detail_resi_view.dart';

class ResiView extends GetView<HomeController> {
  final HomeController HomeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Transaksi'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pencarian dengan no kartu ',
                            ),
                            Text(
                              '${HomeC.noTicket.text}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Menampilkan ',
                            ),
                            Text(
                              '${HomeC.lengthdataResi}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' Data Transaksi ',
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 15,
            child: FutureBuilder<List<ResiModel>>(
              future: HomeC.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ResiModel>? data = snapshot.data;

                  return HomeC.showData.value
                      ? _jobsListView(data)
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'lib/app/images/no_data.json',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Opps No Data Found',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => DetailResiView(),
                arguments: [data[index]],
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black12,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'lib/app/images/calendar.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(data[index].tglTransaksi),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'lib/app/images/toll.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('GT ' + data[index].gerbangExit),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.navigate_next, color: Colors.grey.shade400)
                ],
              ),
            ),
          );
        });
  }
}
